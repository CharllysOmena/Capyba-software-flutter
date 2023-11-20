import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutterapp/app/modules/login/interactor/states/firebase_storage_state.dart';

abstract class IFirebaseStorageService {
  Future<FirebaseStorageState> salvarImagem(File file);
  Future<FirebaseStorageState> deletarImagem(String url);
}

class FirebaseStorageService implements IFirebaseStorageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  @override
  Future<FirebaseStorageState> salvarImagem(File file) async {
    try {
      String nomeArquivo = DateTime.now().millisecondsSinceEpoch.toString();
      UploadTask uploadTask =
          _firebaseStorage.ref('imagens/$nomeArquivo').putFile(file);
      await uploadTask;
      String urlImagem =
          await _firebaseStorage.ref('imagens/$nomeArquivo').getDownloadURL();
      return SuccessFirebaseStorageState(urlImagem: urlImagem);
    } catch (error) {
      return const ErrorExceptionFirebaseStorageState();
    }
  }

  @override
  Future<FirebaseStorageState> deletarImagem(String url) async {
    try {
      Reference referencia = _firebaseStorage.refFromURL(url);
      await referencia.delete();
      return const SuccessFirebaseStorageState(urlImagem: "");
    } catch (error) {
      return const ErrorExceptionFirebaseStorageState();
    }
  }
}
