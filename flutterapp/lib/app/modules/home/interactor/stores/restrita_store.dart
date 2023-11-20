import 'package:mobx/mobx.dart';

part 'restrita_store.g.dart';

class RestritaStore = _RestritaStoreBase with _$RestritaStore;

abstract class _RestritaStoreBase with Store {}
