import 'dart:developer';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:med_facil/view/components/botao_universal.dart';
import 'package:med_facil/view/components/textfild_componente.dart';
import 'package:med_facil/view/controller/editar.dart';
import 'package:med_facil/view/pages/login.dart';
import 'package:med_facil/view/pages/menu.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Editarperfil extends StatefulWidget {
  const Editarperfil({super.key});

  @override
  State<Editarperfil> createState() => _EditarperfilState();
}

class _EditarperfilState extends State<Editarperfil> {
  List lista = ["Ceres", "Itapaci", "Rialma"];
  
  final _formkey = GlobalKey<FormState>();
  final controllerUsername = TextEditingController();
  final controllerCPF = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerTelefone = TextEditingController();
  final controllerDataNascimento = TextEditingController();
  final controllerLogin = TextEditingController();
  final controllerPassword = TextEditingController();

  late String _cidade;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Center(
              child: Text("Med-Fácil", style: TextStyle(color: Colors.white)),
            ), //Utilizamos o TextStyle para alterar o texto
            backgroundColor: const Color.fromRGBO(48, 77, 99, 1),
            elevation: 0,
            leading: Image.asset('assets/images/logo2.png'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuPage()));
                  },
                  icon: const Icon(Icons.house, color: Colors.white))
            ] //Podemos utilizar a ação onPressed para chamar uma função
            ),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      const Text('Editar perfil',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF304D63),
                              fontSize: 24,
                              fontFamily: 'Palanquin Dark',
                              fontWeight: FontWeight.w700,
                              height: 0)),
                      const SizedBox(height: 10),
                      Container(
                          width: 318,
                          decoration: const ShapeDecoration(
                              color: Color(0xFF304D63),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1,
                                      strokeAlign:
                                          BorderSide.strokeAlignCenter)))),
                      const SizedBox(height: 10),
                      const Text('Edite suas informações!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w400,
                              height: 0)),
                      const SizedBox(height: 20),

                      //formulario

                      UserScreen(),
                      
                      const SizedBox(height: 20),

                      //botao de salvar
                      BotaoUniversal(
                          buttonText: 'Salvar',
                          onTapButton: () => usuarioAlterado())
                    ]
                    )
                  )
                )
              )
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
                              builder: (context) => const LoginPage()));
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


  void usuarioAlterado() async {
    if (!_formkey.currentState!.validate()) {
      return;
    }
    var userPrimario = await ParseUser.currentUser();

    final username = controllerUsername.text.trim();
    final cpf = controllerCPF.text.trim();
    final email = controllerEmail.text.trim();
    final telefone = controllerTelefone.text.trim();
    final dataNascimento = controllerDataNascimento.text.trim();
    final login = controllerLogin.text.trim();
    final password = controllerPassword.text.trim();

    final user = ParseUser(null, null, userPrimario.objectId); 

    // transform datetime

    DateTime data = converterData(dataNascimento);

    user.set<String>("cpf", cpf);
    user.set<String>("telefone", telefone);
    user.set<DateTime>("dataNascimento", data);
    user.set<String>("endereco", _cidade);
    user.set<String>("login", login);

    var response = await user.save();

    if (response.success) {
      showSuccess("Usuario criado!!");
    } else {
      showError("Algo ficou errado!!");
    }
  }

  DateTime converterData(String dataNascimento) {
    var list = dataNascimento.split('/');
    final dataFormatada = "${list[2]}-${list[1]}-${list[0]}";
    log(dataFormatada);
    final data = DateTime.parse(dataFormatada);

    return data;
  }
}
