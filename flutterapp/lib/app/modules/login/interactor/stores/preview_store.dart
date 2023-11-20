import 'dart:io';

import 'package:mobx/mobx.dart';

part 'preview_store.g.dart';

class PreviewStore = _PreviewStoreBase with _$PreviewStore;

abstract class _PreviewStoreBase with Store {
  File? arquivo;

  salvarArquivo(file) {
    if (file != null) {
      arquivo = file;
    }
  }
}
