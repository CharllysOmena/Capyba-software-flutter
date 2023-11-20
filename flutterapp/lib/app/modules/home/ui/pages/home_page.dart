import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterapp/app/modules/home/ui/pages/documentos_page.dart';
import 'package:flutterapp/app/modules/home/ui/pages/perfil_page.dart';
import 'package:flutterapp/app/modules/home/ui/pages/restrita_page.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../interactor/stores/home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  List<String> titulos = ["Meu perfil", "Home", "Área restrita"];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<StatefulWidget> telas = [
      const PerfilPage(),
      const DocumentosPage(),
      const RestritaPage()
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Observer(builder: (context) {
          return Text(titulos[store.indice]);
        }),
        actions: [
          IconButton(
            onPressed: () => store.logout(),
            icon: const Icon(Icons.arrow_back),
          )
        ],
      ),
      body: Observer(
        builder: (context) {
          return telas[store.indice];
        },
      ),
      bottomNavigationBar: Observer(
        builder: (context) {
          return BottomNavigationBar(
            currentIndex: store.indice,
            onTap: (indice) => store.trocarIndice(indice),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            fixedColor: Colors.lightGreen,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), label: "Meu perfil"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.document_scanner), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.private_connectivity),
                  label: "Área restrita"),
            ],
          );
        },
      ),
    );
  }
}
