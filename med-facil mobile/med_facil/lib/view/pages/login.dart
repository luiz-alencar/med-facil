// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:med_facil/view/components/textfild_componente.dart';
import 'package:med_facil/view/components/titulo_imagem.dart';
import 'package:med_facil/view/pages/cadastro_usuario.dart';
import 'package:med_facil/view/pages/menu.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
    //Controllers dos formulários
  TextEditingController controllerEmail = TextEditingController();

  TextEditingController controllerSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TituloImagem(),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFieldComponente(
                        hintText: 'Login',
                        obscureText: false,
                        controller: controllerEmail,
                        validator: (value) => validate(value),
                        keyboardType: TextInputType.emailAddress, 
                      ),
                      const SizedBox(height: 10),
                      TextFieldComponente(
                        hintText: 'Senha',
                        obscureText: true,
                        controller: controllerSenha,
                        validator: (value) => validate(value),
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),
                      Container(
                          width: 344,
                          height: 44,
                          child: TextButton(
                            onPressed: () => logar(),
                            child: Text('Entrar',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.white)),
                          ),
                          decoration: ShapeDecoration(
                            color: Color(0xFF304D63),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          )),
                      const SizedBox(height: 10),
                      Container(
                        width: 324,
                        height: 20,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 12,
                              child: Container(
                                width: 147,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 177,
                              top: 12,
                              child: Container(
                                width: 147,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 154,
                              top: 0,
                              child: Text(
                                'ou',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                          width: 344,
                          height: 44,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CadastroUsuarioPage()),
                              );
                            },
                            child: Text('Cadastre-se',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.white)),
                          ),
                          decoration: ShapeDecoration(
                            color: Color(0xFF304D63),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          )),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    ));
  }

  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "* Campo Obrigatorio";
    }
    return null;
  }

  void logar() async {
    if (!_formkey.currentState!.validate()) {
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MenuPage()),
    );
  }
}
