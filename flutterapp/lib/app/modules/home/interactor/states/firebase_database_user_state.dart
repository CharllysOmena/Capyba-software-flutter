import 'package:flutterapp/app/modules/home/data/models/usuario.dart';

abstract interface class FirebaseUserDatabaseState {}

class StartFirebaseUserDatabaseState implements FirebaseUserDatabaseState {
  const StartFirebaseUserDatabaseState();
}

class SuccessGetFirebaseUserDatabaseState implements FirebaseUserDatabaseState {
  final Usuario usuario;
  const SuccessGetFirebaseUserDatabaseState({required this.usuario});
}

class SuccessFirebaseUserDatabaseState implements FirebaseUserDatabaseState {
  const SuccessFirebaseUserDatabaseState();
}

class ErrorExceptionFirebaseUserDatabaseState
    implements FirebaseUserDatabaseState {
  const ErrorExceptionFirebaseUserDatabaseState();
}

class LoadingFirebaseUserDatabaseState implements FirebaseUserDatabaseState {
  const LoadingFirebaseUserDatabaseState();
}

class EmptyFirebaseUserDatabaseState implements FirebaseUserDatabaseState {
  const EmptyFirebaseUserDatabaseState();
}
