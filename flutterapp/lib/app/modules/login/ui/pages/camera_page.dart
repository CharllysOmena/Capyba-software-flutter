import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CameraPage extends StatefulWidget {
  final String title;
  const CameraPage({Key? key, this.title = 'CameraPage'}) : super(key: key);
  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    File? arquivoTemporario;
    return Scaffold(
      appBar: AppBar(
        title: Text("Tire uma foto para continuar"),
        centerTitle: true,
      ),
      body: CameraCamera(
        onFile: ((file) {
          arquivoTemporario = file;
          Modular.to.pushNamed("/login/preview", arguments: arquivoTemporario);
        }),
      ),
    );
  }
}
