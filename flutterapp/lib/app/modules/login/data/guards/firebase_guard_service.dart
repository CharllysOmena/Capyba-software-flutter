import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterapp/app/modules/login/data/services/firebase_login_service.dart';

class FirebaseGuardService implements RouteGuard {
  final FirebaseLoginService firebaseLoginService;

  FirebaseGuardService({required this.firebaseLoginService});

  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    return firebaseLoginService.isAuthenticated;
  }

  @override
  String? get guardedRoute => '/login';
}
