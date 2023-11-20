// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CadastroStore on _CadastroStoreBase, Store {
  late final _$stateAtom =
      Atom(name: '_CadastroStoreBase.state', context: context);

  @override
  FirebaseCadastroState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(FirebaseCadastroState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$registerAsyncAction =
      AsyncAction('_CadastroStoreBase.register', context: context);

  @override
  Future<dynamic> register(String email, String senha, String nome) {
    return _$registerAsyncAction.run(() => super.register(email, senha, nome));
  }

  late final _$salvarDadosAsyncAction =
      AsyncAction('_CadastroStoreBase.salvarDados', context: context);

  @override
  Future<dynamic> salvarDados(Usuario usuario) {
    return _$salvarDadosAsyncAction.run(() => super.salvarDados(usuario));
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
