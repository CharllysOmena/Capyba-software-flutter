import 'package:firebase_auth/firebase_auth.dart';

abstract interface class FirebaseLoginState {}

class StartFirebaseLoginState implements FirebaseLoginState {
  const StartFirebaseLoginState();
}

class SuccessFirebaseLoginState implements FirebaseLoginState {
  final UserCredential userCredential;
  const SuccessFirebaseLoginState({required this.userCredential});
}

class ErrorExceptionFirebaseLoginState implements FirebaseLoginState {
  const ErrorExceptionFirebaseLoginState();
}

class LoadingFirebaseLoginState implements FirebaseLoginState {
  const LoadingFirebaseLoginState();
}

class EmptyFirebaseLoginState implements FirebaseLoginState {
  const EmptyFirebaseLoginState();
}
