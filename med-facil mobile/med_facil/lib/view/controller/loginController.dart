import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:med_facil/view/components/botao_universal.dart';
import 'package:med_facil/view/components/textfild_componente.dart';
import 'package:med_facil/view/pages/cadastro_usuario.dart';
import 'package:med_facil/view/pages/menu.dart';

class loginController extends StatefulWidget {
  @override
  State<loginController> createState() => _loginControllerState();
}

class _loginControllerState extends State<loginController> {
  final _formkey = GlobalKey<FormState>();
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
        //formulario
        Form(
      key: _formkey,
      child: Column(
        children: [
          TextFieldComponente(
              hintText: 'Login',
              obscureText: false,
              controller: controllerUsername,
              validator: (value) => validate(value),
              keyboardType: TextInputType.emailAddress),
          const SizedBox(height: 10),
          TextFieldComponente(
              hintText: 'Senha',
              obscureText: true,
              controller: controllerPassword,
              validator: (value) => validate(value),
              keyboardType: TextInputType.text),
          const SizedBox(height: 15),
          BotaoUniversal(buttonText: 'Entrar', onTapButton: () => logar()),
          const SizedBox(height: 10),
          SizedBox(
            width: 324,
            height: 20,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 12,
                  child: Container(
                    width: 147,
                    decoration: const ShapeDecoration(
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
                    decoration: const ShapeDecoration(
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
                const Positioned(
                  left: 154,
                  top: 0,
                  child: Text(
                    'ou',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w500,
                        height: 0),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          BotaoUniversal(
            buttonText: 'Cadastre-se',
            onTapButton: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CadastroUsuarioPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "* Campo Obrigatorio";
    }
    return null;
  }

  void showSuccess(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("Successo!"),
              content: Text(message),
              actions: <Widget>[
                TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MenuPage()));
                    })
              ]);
        });
  }

  void showError(String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("Inválido!"),
              content: Text(errorMessage),
              actions: <Widget>[
                TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  void logar() async {
    if (!_formkey.currentState!.validate()) {
      return;
    }
    final username = controllerUsername.text.trim();
    final password = controllerPassword.text.trim();

    final user = ParseUser(username, password, null);

    var response = await user.login();

    if (response.success) {
      showSuccess("Você está sendo redirecionado para o menu inicial!!");
    } else {
      showError("Verifique seu usuário ou senha!!");
    }
  }
}
