import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../interactor/stores/login_store.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.senhaController,
    required this.store,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController senhaController;
  final LoginStore store;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Padding(
        padding: const EdgeInsets.only(top: 230.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
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
              Padding(
                padding: EdgeInsets.only(top: 16, bottom: 16),
                child: TextFormField(
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
              ),
              ElevatedButton(
                onPressed: () =>
                    store.signIn(emailController.text, senhaController.text),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  backgroundColor: Colors.lightGreen,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                child: const Text("Entrar"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => Modular.to.pushNamed("/login/camera"),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      text: "Não possui conta? ",
                      children: [
                        TextSpan(
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.green,
                          ),
                          text: "Cadastre-se",
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
