abstract interface class FirebaseStorageState {}

class StartFirebaseStorageState implements FirebaseStorageState {
  const StartFirebaseStorageState();
}

class SuccessFirebaseStorageState implements FirebaseStorageState {
  final String urlImagem;
  const SuccessFirebaseStorageState({required this.urlImagem});
}

class ErrorExceptionFirebaseStorageState implements FirebaseStorageState {
  const ErrorExceptionFirebaseStorageState();
}

class LoadingFirebaseStorageState implements FirebaseStorageState {
  const LoadingFirebaseStorageState();
}

class EmptyFirebaseStorageState implements FirebaseStorageState {
  const EmptyFirebaseStorageState();
}
