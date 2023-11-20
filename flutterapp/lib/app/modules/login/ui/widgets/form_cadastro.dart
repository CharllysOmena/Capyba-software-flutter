import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../interactor/stores/cadastro_store.dart';

class FormCadastro extends StatelessWidget {
  const FormCadastro({
    super.key,
    required this.formkey,
    required this.nomeController,
    required this.emailController,
    required this.senhaController,
    required this.store,
  });

  final GlobalKey<FormState> formkey;
  final TextEditingController nomeController;
  final TextEditingController emailController;
  final TextEditingController senhaController;
  final CadastroStore store;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Form(
        key: formkey,
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Color.fromARGB(255, 150, 146, 146),
              backgroundImage: FileImage(Modular.args!.data),
              radius: 75.0,
            ),
            SizedBox(height: 20),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (nome) => nome != null && nome.length < 3
                  ? 'Digite um nome valido'
                  : null,
              controller: nomeController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'NOME'),
            ),
            SizedBox(height: 20),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? 'Digite um email valido'
                      : null,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'E-MAIL'),
            ),
            SizedBox(height: 20),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (senha) => senha != null && senha.length < 6
                  ? 'Minimo de 6 caracteres'
                  : null,
              controller: senhaController,
              obscureText: true,
              obscuringCharacter: "*",
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(), labelText: 'SENHA'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                store.register(emailController.text, senhaController.text,
                    nomeController.text);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
                backgroundColor: Colors.lightGreen,
                textStyle: const TextStyle(
                  fontSize: 20,
                ),
              ),
              child: const Text("Cadastrar"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => Modular.to.navigate("/login"),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 15),
                    text: "Ja possui conta? ",
                    children: [
                      TextSpan(
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.lightGreen,
                        ),
                        text: "Entrar",
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
