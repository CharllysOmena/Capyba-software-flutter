import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterapp/app/modules/home/interactor/states/firebase_database_user_state.dart';
import 'package:flutterapp/app/modules/home/interactor/stores/perfil_store.dart';

class PerfilPage extends StatefulWidget {
  final String title;
  const PerfilPage({Key? key, this.title = 'PerfilPage'}) : super(key: key);
  @override
  PerfilPageState createState() => PerfilPageState();
}

class PerfilPageState extends State<PerfilPage> {
  PerfilStore store = Modular.get<PerfilStore>();

  @override
  void initState() {
    store.getPerfil();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Observer(
          builder: (context) {
            if (store.state is LoadingFirebaseUserDatabaseState) {
              return const Center(child: CircularProgressIndicator());
            } else if (store.state is SuccessGetFirebaseUserDatabaseState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 150, 146, 146),
                      backgroundImage: NetworkImage(store.usuario!.url),
                      radius: 75.0,
                    ),
                    SizedBox(height: 40),
                    Form(
                      key: store.formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            enabled: false,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (nome) => nome != null && nome.length < 3
                                ? 'Digite um nome valido'
                                : null,
                            controller: store.nomeController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              disabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.green),
                              ),
                              labelStyle: TextStyle(color: Colors.green),
                              labelText: 'NOME',
                            ),
                          ),
                          SizedBox(height: 30),
                          TextFormField(
                            enabled: false,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (email) =>
                                email != null && !EmailValidator.validate(email)
                                    ? 'Digite um email valido'
                                    : null,
                            controller: store.emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              disabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.green),
                              ),
                              labelText: 'E-MAIL',
                              labelStyle: TextStyle(color: Colors.green),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (store.state is ErrorExceptionFirebaseUserDatabaseState) {
              return Center(child: Text("Erro"));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
