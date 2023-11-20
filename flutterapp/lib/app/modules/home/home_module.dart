import 'package:flutterapp/app/modules/home/data/services/firebase_database_documento_service.dart';
import 'package:flutterapp/app/modules/home/interactor/stores/restrita_store.dart';
import 'package:flutterapp/app/modules/home/interactor/stores/perfil_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterapp/app/modules/home/data/services/firebase_login_service.dart';
import 'package:flutterapp/app/modules/home/data/services/firebase_database_user_service.dart';

import 'interactor/stores/documentos_store.dart';
import 'interactor/stores/home_store.dart';
import 'ui/pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => FirebaseDatabaseDocumentoService()),
    Bind.lazySingleton(
        (i) => DocumentosStore(firebaseDatabaseDocumentoService: i.get())),
    Bind.lazySingleton((i) => RestritaStore()),
    Bind((i) => FirebaseDatabaseUserService()),
    Bind.lazySingleton(
        (i) => PerfilStore(firebaseDatabaseUserService: i.get())),
    Bind.lazySingleton((i) => FirebaseLoginService()),
    Bind.lazySingleton((i) => HomeStore(firebaseLoginService: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
