import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterapp/app/modules/login/data/services/firebase_login_service.dart';
import 'package:flutterapp/app/modules/login/interactor/states/firebase_login_state.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final IFirebaseLoginService firebaseLoginService;

  _LoginStoreBase({required this.firebaseLoginService});

  @observable
  FirebaseLoginState state = const StartFirebaseLoginState();

  User? user;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @action
  Future signIn(String email, String senha) async {
    state = const LoadingFirebaseLoginState();
    var response =
        await firebaseLoginService.signIn(email.trim(), senha.trim());
    state = response;
    if (response is SuccessFirebaseLoginState) {
      user = response.userCredential.user;
      Modular.to.navigate("/", arguments: user);
    } else if (response is ErrorExceptionFirebaseLoginState) {
      Fluttertoast.showToast(
        msg: "E-mail ou senha incorreta!",
        backgroundColor: Colors.lightGreen,
        textColor: Colors.black,
      );
    }
  }
}
