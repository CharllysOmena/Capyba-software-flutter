import 'package:firebase_auth/firebase_auth.dart';

abstract interface class FirebaseCadastroState {}

class StartFirebaseCadastroState implements FirebaseCadastroState {
  const StartFirebaseCadastroState();
}

class SuccessFirebaseCadastroState implements FirebaseCadastroState {
  final UserCredential userCredential;
  const SuccessFirebaseCadastroState({required this.userCredential});
}

class SuccessDeleteFirebaseCadastroState implements FirebaseCadastroState {
  const SuccessDeleteFirebaseCadastroState();
}

class ErrorExceptionFirebaseCadastroState implements FirebaseCadastroState {
  const ErrorExceptionFirebaseCadastroState();
}

class LoadingFirebaseCadastroState implements FirebaseCadastroState {
  const LoadingFirebaseCadastroState();
}

class EmptyFirebaseCadastroState implements FirebaseCadastroState {
  const EmptyFirebaseCadastroState();
}
