import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterapp/app/modules/login/data/guards/firebase_guard_service.dart';
import 'package:flutterapp/app/modules/login/data/services/firebase_login_service.dart';

import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule(), guards: [
      FirebaseGuardService(firebaseLoginService: FirebaseLoginService())
    ]),
    ModuleRoute("/login", module: LoginModule())
  ];
}
