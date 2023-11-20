import 'package:flutter/material.dart';
import 'package:flutterapp/app/modules/home/data/models/usuario.dart';
import 'package:flutterapp/app/modules/home/data/services/firebase_database_user_service.dart';
import 'package:flutterapp/app/modules/home/interactor/states/firebase_database_user_state.dart';
import 'package:mobx/mobx.dart';

part 'perfil_store.g.dart';

class PerfilStore = _PerfilStoreBase with _$PerfilStore;

abstract class _PerfilStoreBase with Store {
  final IFirebaseDatabaseUserService firebaseDatabaseUserService;

  _PerfilStoreBase({required this.firebaseDatabaseUserService});

  Usuario? usuario;

  final formKey = GlobalKey<FormState>();
  TextEditingController? nomeController = TextEditingController();
  TextEditingController? emailController = TextEditingController();

  @observable
  FirebaseUserDatabaseState state = const StartFirebaseUserDatabaseState();

  @action
  Future getPerfil() async {
    state = const LoadingFirebaseUserDatabaseState();
    var response = await firebaseDatabaseUserService.get();
    if (response is SuccessGetFirebaseUserDatabaseState) {
      usuario = response.usuario;
      nomeController!.text = usuario!.nome;
      emailController!.text = usuario!.email;
    }
    state = response;
  }
}
