import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapp/app/modules/home/data/models/usuario.dart';
import 'package:flutterapp/app/modules/home/interactor/states/firebase_database_user_state.dart';

abstract class IFirebaseDatabaseUserService {
  Future<FirebaseUserDatabaseState> post(Usuario usuario);
  Future<FirebaseUserDatabaseState> put(Usuario usuario);
  Future<FirebaseUserDatabaseState> get();
}

class FirebaseDatabaseUserService implements IFirebaseDatabaseUserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  final CollectionReference usuariosCollection =
      FirebaseFirestore.instance.collection('usuarios');

  @override
  Future<FirebaseUserDatabaseState> post(Usuario usuario) async {
    try {
      DocumentReference documentReference = await usuariosCollection.add({
        'id': usuario.id,
        'nome': usuario.nome,
        'email': usuario.email,
        'url': usuario.url,
      });

      return const SuccessFirebaseUserDatabaseState();
    } catch (error) {
      return const ErrorExceptionFirebaseUserDatabaseState();
    }
  }

  @override
  Future<FirebaseUserDatabaseState> put(Usuario usuario) async {
    try {
      await usuariosCollection.doc(usuario.email).update({
        'id': usuario.id,
        'nome': usuario.nome,
        'email': usuario.email,
        'url': usuario.url,
      });

      return const SuccessFirebaseUserDatabaseState();
    } catch (error) {
      return const ErrorExceptionFirebaseUserDatabaseState();
    }
  }

  @override
  Future<FirebaseUserDatabaseState> get() async {
    try {
      QuerySnapshot querySnapshot =
          await usuariosCollection.where("id", isEqualTo: user!.uid).get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        Usuario usuario = Usuario(
          id: documentSnapshot['id'],
          nome: documentSnapshot['nome'],
          email: documentSnapshot['email'],
          url: documentSnapshot['url'],
        );
        return SuccessGetFirebaseUserDatabaseState(usuario: usuario);
      } else {
        return const ErrorExceptionFirebaseUserDatabaseState();
      }
    } catch (error) {
      return const ErrorExceptionFirebaseUserDatabaseState();
    }
  }
}
