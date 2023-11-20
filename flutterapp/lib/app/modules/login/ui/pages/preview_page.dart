import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../interactor/stores/preview_store.dart';
import '../widgets/botao_circular.dart';

class PreviewPage extends StatefulWidget {
  final String title;
  const PreviewPage({Key? key, this.title = 'PreviewPage'}) : super(key: key);
  @override
  PreviewPageState createState() => PreviewPageState();
}

class PreviewPageState extends State<PreviewPage> {
  @override
  Widget build(BuildContext context) {
    PreviewStore store = Modular.get<PreviewStore>();
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.file(
            Modular.args!.data,
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BotaoCircular(
                      metodo: () {
                        store.salvarArquivo(Modular.args!.data);
                        Modular.to.navigate(
                          "/login/cadastro",
                          arguments: store.arquivo,
                        );
                      },
                      icon: Icon(
                        Icons.check,
                        size: 40,
                        color: Colors.white,
                      ),
                      texto: "",
                      color: Colors.green),
                  BotaoCircular(
                      metodo: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        size: 40,
                        color: Colors.white,
                      ),
                      texto: "",
                      color: Colors.red)
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
