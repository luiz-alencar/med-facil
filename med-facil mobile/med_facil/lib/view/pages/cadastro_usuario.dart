import 'dart:developer';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:med_facil/view/components/botao_universal.dart';
import 'package:med_facil/view/components/textfild_componente.dart';
import 'package:med_facil/view/components/titulo_imagem.dart';
import 'package:med_facil/view/pages/login.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class CadastroUsuarioPage extends StatefulWidget {
  const CadastroUsuarioPage({super.key});

  @override
  State<CadastroUsuarioPage> createState() => _CadastroUsuarioPageState();
}

class _CadastroUsuarioPageState extends State<CadastroUsuarioPage> {
  final _formkey = GlobalKey<FormState>();
  final controllerUsername = TextEditingController();
  final controllerCPF = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerTelefone = TextEditingController();
  final controllerDataNascimento = TextEditingController();
  final controllerLogin = TextEditingController();
  final controllerPassword = TextEditingController();

  late ParseObject _cidade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      const TituloImagem(),

                      //formulario
                      Form(
                          key: _formkey,
                          child: Column(children: [
                            TextFieldComponente(
                                hintText: 'Nome completo',
                                obscureText: false,
                                controller: controllerUsername,
                                validator: (value) => validate(value),
                                keyboardType: TextInputType.text),
                            const SizedBox(height: 10),
                            TextFormField(
                                obscureText: false,
                                validator: (value) => validate(value),
                                controller: controllerCPF,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    hintText: 'CPF'),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  CpfInputFormatter(),
                                ],
                                keyboardType: TextInputType.number),
                            const SizedBox(height: 10),
                            TextFieldComponente(
                                hintText: 'E-mail',
                                obscureText: false,
                                controller: controllerEmail,
                                validator: (value) => validate(value),
                                keyboardType: TextInputType.emailAddress),
                            const SizedBox(height: 10),
                            TextFormField(
                                obscureText: false,
                                validator: (value) => validate(value),
                                controller: controllerTelefone,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    hintText: 'Telefone'),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  TelefoneInputFormatter(),
                                ],
                                keyboardType: TextInputType.number),
                            const SizedBox(height: 10),
                            TextFormField(
                                obscureText: false,
                                validator: (value) => validate(value),
                                controller: controllerDataNascimento,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    hintText: 'Data de nascimento'),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  DataInputFormatter(),
                                ],
                                keyboardType: TextInputType.text),
                            const SizedBox(height: 10),
                            FutureBuilder<List<ParseObject>>(
                                future: getCities(),
                                builder: (context, snapshot) {
                                  final cidades = snapshot.data;
                                  return DropdownButtonFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12))),
                                      ),
                                      hint:
                                          const Text("Selecione a sua cidade"),
                                      onChanged: (newValue) {
                                        setState(() {
                                          _cidade = newValue as ParseObject;
                                        });
                                      },
                                      items: cidades?.map((valueItem) {
                                        return DropdownMenuItem(
                                            value: valueItem,
                                            child: Text(
                                                valueItem.get('nome_cidade')));
                                      }).toList());
                                }),
                            const SizedBox(height: 10),
                            TextFieldComponente(
                                hintText: 'Nome usuário',
                                obscureText: false,
                                controller: controllerLogin,
                                validator: (value) => validate(value),
                                keyboardType: TextInputType.text),
                            const SizedBox(height: 10),
                            TextFieldComponente(
                                hintText: 'Senha',
                                obscureText: false,
                                controller: controllerPassword,
                                validator: (value) => validate(value),
                                keyboardType: TextInputType.text),
                          ])),
                      const SizedBox(height: 20),

                      //botão de salvar
                      BotaoUniversal(
                          buttonText: 'Salvar',
                          onTapButton: () => novoUsuario())
                    ])))));
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

  void novoUsuario() async {
    if (!_formkey.currentState!.validate()) {
      return;
    }

    final username = controllerUsername.text.trim();
    final cpf = controllerCPF.text.trim();
    final email = controllerEmail.text.trim();
    final telefone = controllerTelefone.text.trim();
    final dataNascimento = controllerDataNascimento.text.trim();
    final login = controllerLogin.text.trim();
    final password = controllerPassword.text.trim();

    final user = ParseUser.createUser(username, password, email);

    // transform datetime

    DateTime data = converterData(dataNascimento);

    user.set<String>("cpf", cpf);
    user.set<String>("telefone", telefone);
    user.set<DateTime>("dataNascimento", data);
    user.set<ParseObject>("cidade_id", _cidade);
    user.set<String>("login", login);

    var response = await user.signUp();

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

  Future<List<ParseObject>> getCities() async {
    QueryBuilder<ParseObject> queryCity =
        QueryBuilder<ParseObject>(ParseObject('Cidade'));
    final ParseResponse apiResponse = await queryCity.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }
}
