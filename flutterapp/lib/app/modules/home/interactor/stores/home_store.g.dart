// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$indiceAtom =
      Atom(name: 'HomeStoreBase.indice', context: context);

  @override
  int get indice {
    _$indiceAtom.reportRead();
    return super.indice;
  }

  @override
  set indice(int value) {
    _$indiceAtom.reportWrite(value, super.indice, () {
      super.indice = value;
    });
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  dynamic trocarIndice(int novoIndice) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.trocarIndice');
    try {
      return super.trocarIndice(novoIndice);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
indice: ${indice}
    ''';
  }
}
