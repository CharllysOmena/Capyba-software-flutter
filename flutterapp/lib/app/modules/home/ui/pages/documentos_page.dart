import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterapp/app/modules/home/interactor/states/firebase_database_documento_state.dart';
import 'package:flutterapp/app/modules/home/interactor/stores/documentos_store.dart';
import 'package:flutterapp/app/modules/home/ui/widgets/loading.dart';
import 'package:flutterapp/app/modules/home/ui/widgets/error.dart';

class DocumentosPage extends StatefulWidget {
  final String title;
  const DocumentosPage({Key? key, this.title = 'Home'}) : super(key: key);
  @override
  DocumentosPageState createState() => DocumentosPageState();
}

class DocumentosPageState extends State<DocumentosPage> {
  DocumentosStore store = Modular.get<DocumentosStore>();

  @override
  void initState() {
    store.getDocumentos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        if (store.state is LoadingFirebaseDocumentoDatabaseState) {
          return const Loading();
        } else if (store.state is SuccessGetFirebaseDocumentoDatabaseState) {
          return ListView.builder(
            itemCount: store.documentos!.length,
            itemBuilder: (_, index) {
              return Card(
                child: ListTile(
                  title: Text(store.documentos![index].titulo),
                  subtitle: Text(store.documentos![index].descricao),
                ),
              );
            },
          );
        } else if (store.state
            is ErrorExceptionFirebaseDocumentoDatabaseState) {
          return Error();
        } else {
          return Container();
        }
      }),
    );
  }
}
