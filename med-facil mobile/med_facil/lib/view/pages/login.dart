import 'package:flutter/material.dart';
import 'package:med_facil/view/components/titulo_imagem.dart';
import 'package:med_facil/view/controller/loginController.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //imagem
                  const TituloImagem(),

                  //formulario
                  loginController()
                ]),
          ),
        ),
      ),
    );
  }
}
