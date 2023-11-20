import 'package:flutterapp/app/modules/home/data/models/documento.dart';
import 'package:flutterapp/app/modules/home/data/models/usuario.dart';

abstract interface class FirebaseDocumentoDatabaseState {}

class StartFirebaseDocumentoDatabaseState
    implements FirebaseDocumentoDatabaseState {
  const StartFirebaseDocumentoDatabaseState();
}

class SuccessGetFirebaseDocumentoDatabaseState
    implements FirebaseDocumentoDatabaseState {
  final List<Documento> documentos;
  const SuccessGetFirebaseDocumentoDatabaseState({required this.documentos});
}

class SuccessFirebaseDocumentoDatabaseState
    implements FirebaseDocumentoDatabaseState {
  const SuccessFirebaseDocumentoDatabaseState();
}

class ErrorExceptionFirebaseDocumentoDatabaseState
    implements FirebaseDocumentoDatabaseState {
  const ErrorExceptionFirebaseDocumentoDatabaseState();
}

class LoadingFirebaseDocumentoDatabaseState
    implements FirebaseDocumentoDatabaseState {
  const LoadingFirebaseDocumentoDatabaseState();
}

class EmptyFirebaseDocumentoDatabaseState
    implements FirebaseDocumentoDatabaseState {
  const EmptyFirebaseDocumentoDatabaseState();
}
