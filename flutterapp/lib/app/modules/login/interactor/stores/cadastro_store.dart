import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterapp/app/modules/login/data/models/usuario.dart';
import 'package:flutterapp/app/modules/login/data/services/firebase_cadastro_service.dart';
import 'package:flutterapp/app/modules/login/data/services/firebase_storage_service.dart';
import 'package:flutterapp/app/modules/login/interactor/states/firebase_cadastro_state.dart';
import 'package:flutterapp/app/modules/login/interactor/states/firebase_database_user_state.dart';
import 'package:flutterapp/app/modules/login/interactor/states/firebase_storage_state.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';

import '../../data/services/firebase_database_user_service.dart';

part 'cadastro_store.g.dart';

class CadastroStore = _CadastroStoreBase with _$CadastroStore;

abstract class _CadastroStoreBase with Store {
  final IFirebaseCadastroService firebaseCadastroService;
  final IFirebaseStorageService firebaseStorageService;
  final IFirebaseDatabaseUserService firebaseDatabaseUserService;

  @observable
  FirebaseCadastroState state = const StartFirebaseCadastroState();

  final formkey = GlobalKey<FormState>();
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  User? user;
  String? url;
  Usuario? usuario;

  _CadastroStoreBase({
    required this.firebaseStorageService,
    required this.firebaseCadastroService,
    required this.firebaseDatabaseUserService,
  });

  @action
  Future register(String email, String senha, String nome) async {
    state = const LoadingFirebaseCadastroState();
    var response =
        await firebaseCadastroService.register(email.trim(), senha.trim());
    if (response is SuccessFirebaseCadastroState) {
      user = response.userCredential.user;
      await salvarImagem(email, nome);
      state = response;
    } else if (response is ErrorExceptionFirebaseCadastroState) {
      state = const ErrorExceptionFirebaseCadastroState();
      Fluttertoast.showToast(
        msg: "Esse E-mail ja esta cadastrado!",
        backgroundColor: Colors.lightGreen,
        textColor: Colors.black,
      );
    }
  }

  Future salvarImagem(String email, String nome) async {
    var response =
        await firebaseStorageService.salvarImagem(Modular.args!.data);
    if (response is SuccessFirebaseStorageState) {
      url = response.urlImagem;
      salvarDados(montarDados(email, nome, url!, user!.uid));
    } else if (response is ErrorExceptionFirebaseStorageState) {
      state = const ErrorExceptionFirebaseCadastroState();
      await deleteAccount();
    }
  }

  Future deletarImagem(String url) async =>
      await firebaseStorageService.deletarImagem(url);

  Future deleteAccount() async {
    var response = await firebaseCadastroService.deleteAccount(user!);
    if (response is SuccessDeleteFirebaseCadastroState) {
      Fluttertoast.showToast(
        msg: "Não foi possivel realizar o cadastro, tente novamente!",
        backgroundColor: Colors.lightGreen,
        textColor: Colors.black,
      );
    } else if (response is ErrorExceptionFirebaseCadastroState) {
      state = const ErrorExceptionFirebaseCadastroState();
      Fluttertoast.showToast(
        msg: "houve um erro inexperado, tente novamente!",
        backgroundColor: Colors.lightGreen,
        textColor: Colors.black,
      );
    }
  }

  Usuario montarDados(String email, String nome, String url, String id) =>
      usuario = Usuario(id: id, nome: nome, email: email, url: url);

  @action
  Future salvarDados(Usuario usuario) async {
    var response = await firebaseDatabaseUserService.post(usuario);
    if (response is SuccessFirebaseUserDatabaseState) {
      state = const ErrorExceptionFirebaseCadastroState();
      Modular.to.navigate("/", arguments: user);
    } else if (response is ErrorExceptionFirebaseUserDatabaseState) {
      deleteAccount();
      deletarImagem(usuario.url);
      state = const ErrorExceptionFirebaseCadastroState();
    }
  }
}
