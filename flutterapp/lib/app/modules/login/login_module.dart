import 'package:flutterapp/app/modules/login/data/services/firebase_database_user_service.dart';
import 'package:flutterapp/app/modules/login/data/services/firebase_storage_service.dart';
import 'package:flutterapp/app/modules/login/interactor/stores/preview_store.dart';
import 'package:flutterapp/app/modules/login/data/services/firebase_cadastro_service.dart';
import 'package:flutterapp/app/modules/login/data/services/firebase_login_service.dart';
import 'package:flutterapp/app/modules/login/interactor/stores/login_store.dart';
import 'package:flutterapp/app/modules/login/interactor/stores/cadastro_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterapp/app/modules/login/ui/pages/cadastro_page.dart';
import 'package:flutterapp/app/modules/login/ui/pages/camera_page.dart';
import 'package:flutterapp/app/modules/login/ui/pages/login_page.dart';
import 'package:flutterapp/app/modules/login/ui/pages/preview_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PreviewStore()),
    Bind.lazySingleton((i) => FirebaseLoginService()),
    Bind.lazySingleton((i) => LoginStore(firebaseLoginService: i.get())),
    Bind.lazySingleton((i) => FirebaseCadastroService()),
    Bind.lazySingleton((i) => FirebaseStorageService()),
    Bind.lazySingleton((i) => FirebaseDatabaseUserService()),
    Bind.lazySingleton((i) => CadastroStore(
        firebaseCadastroService: i.get(),
        firebaseStorageService: i.get(),
        firebaseDatabaseUserService: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => LoginPage()),
    ChildRoute("/cadastro", child: (_, args) => CadastroPage()),
    ChildRoute("/camera", child: (_, args) => CameraPage()),
    ChildRoute("/preview", child: (_, args) => PreviewPage()),
  ];
}
