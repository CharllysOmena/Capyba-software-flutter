import 'package:firebase_auth/firebase_auth.dart';

import '../../interactor/states/firebase_cadastro_state.dart';

abstract class IFirebaseCadastroService {
  Future<FirebaseCadastroState> register(String email, String senha);
  Future<FirebaseCadastroState> deleteAccount(User user);
}

class FirebaseCadastroService implements IFirebaseCadastroService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<FirebaseCadastroState> register(String email, String senha) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );
      return SuccessFirebaseCadastroState(userCredential: userCredential);
    } catch (e) {
      return const ErrorExceptionFirebaseCadastroState();
    }
  }

  @override
  Future<FirebaseCadastroState> deleteAccount(User user) async {
    try {
      await user.delete();
      return const SuccessDeleteFirebaseCadastroState();
    } catch (e) {
      return const ErrorExceptionFirebaseCadastroState();
    }
  }
}
