// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStoreBase, Store {
  late final _$stateAtom =
      Atom(name: '_LoginStoreBase.state', context: context);

  @override
  FirebaseLoginState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(FirebaseLoginState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$signInAsyncAction =
      AsyncAction('_LoginStoreBase.signIn', context: context);

  @override
  Future<dynamic> signIn(String email, String senha) {
    return _$signInAsyncAction.run(() => super.signIn(email, senha));
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
