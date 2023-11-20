import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapp/app/modules/home/interactor/states/firebase_database_documento_state.dart';

import '../models/documento.dart';

abstract interface class IFirebaseDatabaseDocumentoService {
  Future<FirebaseDocumentoDatabaseState> get();
}

class FirebaseDatabaseDocumentoService
    implements IFirebaseDatabaseDocumentoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  final CollectionReference documentosCollection =
      FirebaseFirestore.instance.collection('documentos');

  @override
  Future<FirebaseDocumentoDatabaseState> get() async {
    try {
      QuerySnapshot querySnapshot = await documentosCollection.get();
      List<Documento> documentos = [];

      if (querySnapshot.docs.isNotEmpty) {
        for (QueryDocumentSnapshot document in querySnapshot.docs) {
          documentos.add(Documento(
            id: document['id'],
            titulo: document['titulo'],
            descricao: document['descricao'],
          ));
        }
      }

      return SuccessGetFirebaseDocumentoDatabaseState(documentos: documentos);
    } catch (e) {
      return const ErrorExceptionFirebaseDocumentoDatabaseState();
    }
  }
}
