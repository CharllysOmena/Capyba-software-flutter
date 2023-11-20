// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PerfilStore on _PerfilStoreBase, Store {
  late final _$stateAtom =
      Atom(name: '_PerfilStoreBase.state', context: context);

  @override
  FirebaseUserDatabaseState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(FirebaseUserDatabaseState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$getPerfilAsyncAction =
      AsyncAction('_PerfilStoreBase.getPerfil', context: context);

  @override
  Future<dynamic> getPerfil() {
    return _$getPerfilAsyncAction.run(() => super.getPerfil());
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
