import 'package:firebase_auth/firebase_auth.dart';

import '../../interactor/states/firebase_login_state.dart';

abstract class IFirebaseLoginService {
  Future<FirebaseLoginState> signIn(String email, String senha);
  Future signOut();
}

class FirebaseLoginService implements IFirebaseLoginService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool get isAuthenticated => _auth.currentUser != null;

  @override
  Future<FirebaseLoginState> signIn(String email, String senha) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
      return SuccessFirebaseLoginState(userCredential: userCredential);
    } catch (e) {
      return const ErrorExceptionFirebaseLoginState();
    }
  }

  @override
  Future signOut() async {
    await _auth.signOut();
  }
}
