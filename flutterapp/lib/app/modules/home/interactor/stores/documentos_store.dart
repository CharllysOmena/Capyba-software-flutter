import 'package:flutterapp/app/modules/home/data/models/documento.dart';
import 'package:flutterapp/app/modules/home/data/services/firebase_database_documento_service.dart';
import 'package:flutterapp/app/modules/home/interactor/states/firebase_database_documento_state.dart';
import 'package:mobx/mobx.dart';

part 'documentos_store.g.dart';

class DocumentosStore = _DocumentosStoreBase with _$DocumentosStore;

abstract class _DocumentosStoreBase with Store {
  final IFirebaseDatabaseDocumentoService firebaseDatabaseDocumentoService;

  _DocumentosStoreBase({required this.firebaseDatabaseDocumentoService});

  @observable
  FirebaseDocumentoDatabaseState state =
      const StartFirebaseDocumentoDatabaseState();

  List<Documento>? documentos;

  @action
  Future getDocumentos() async {
    var response = await firebaseDatabaseDocumentoService.get();
    if (response is SuccessGetFirebaseDocumentoDatabaseState) {
      documentos = response.documentos;
    }
    state = response;
  }
}
