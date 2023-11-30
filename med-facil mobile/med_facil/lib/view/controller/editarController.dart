import 'dart:developer';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:med_facil/view/components/botao_universal.dart';
import 'package:med_facil/view/components/textfild_componente.dart';
import 'package:med_facil/view/controller/cidadeController.dart';
import 'package:med_facil/view/helpers/rout.helper.dart';
import 'package:med_facil/view/models/cidades.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  ParseUser? user;
  final _formkey = GlobalKey<FormState>();
  final controllerUsername = TextEditingController();
  final controllerCPF = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerTelefone = TextEditingController();
  final controllerDataNascimento = TextEditingController();
  final controllerNome = TextEditingController();
  final controllerPassword = TextEditingController();

  Cidade? cidade;
  Cidade? _cidade;

  late Future<ParseUser?> fetch;

  late Future<List<Cidade>?> cidadeList;

  final cidadeController = CidadeController();

  @override
  void initState() {
    super.initState();
    fetch = fetchUser();
    cidadeList = getCidades();
  }

  Future<ParseUser?> fetchUser() async {
    var user = await ParseUser.currentUser();
    var queryBuilder = QueryBuilder<ParseUser>(ParseUser.forQuery())
      ..whereEqualTo('objectId', user.objectId)
      ..includeObject(['cidadeId']);

    var response = await queryBuilder.query();
    //log(user.username);
    // ignore: unnecessary_null_comparison
    if (response != null) {
      if (response.success && response.results != null) {
        var userResponse = response.results?.first as ParseUser;
        // Aqui você pode acessar os dados do usuário
        // Ex: var username = userResponse.username;

        return userResponse;

        // Adicione mais Text Widgets para exibir mais informações do usuári;
      } else {
        log(response.error!.message);
      }
    } else {
      log('Nenhum usuário logado');
    }
    return null;
  }

  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "* Campo Obrigatorio";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ParseUser?>(
        future: fetch,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      color: Color(0xFF304D63),
                    )),
              );
            default:
              final user = snapshot.data;
              final data = user?.get("dataNascimento");
              controllerCPF.text = user?.get<String>("cpf") ?? "";
              controllerTelefone.text = user?.get<String>("telefone") ?? "";
              controllerEmail.text = user?.get<String>("email") ?? "";
              controllerDataNascimento.text = _formatarData(data);
              controllerUsername.text = user?.get<String>("username") ?? "";
              controllerNome.text = user?.get<String>("nome") ?? "";
              return Column(
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
                                  strokeAlign: BorderSide.strokeAlignCenter)))),
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
                  Form(
                      key: _formkey,
                      child: Column(children: [
                        TextFieldComponente(
                            hintText: 'Nome completo',
                            obscureText: false,
                            controller: controllerNome,
                            validator: (value) => validate(value),
                            keyboardType: TextInputType.text),
                        const SizedBox(height: 10),
                        TextFormField(
                            obscureText: false,
                            validator: (value) => validate(value),
                            controller: controllerCPF,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
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
                                    borderRadius: BorderRadius.circular(12)),
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
                                    borderRadius: BorderRadius.circular(12)),
                                hintText: 'Data de nascimento'),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              DataInputFormatter(),
                            ],
                            keyboardType: TextInputType.number),
                        const SizedBox(height: 10),
                        FutureBuilder<List<Cidade>?>(
                          future: cidadeList,
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.none:
                              case ConnectionState.waiting:
                                return const Center(
                                  child: SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: CircularProgressIndicator()),
                                );
                              default:
                                final cidades = snapshot.data;
                                final cityName =
                                    user?["cidadeId"]["nomeCidade"] ?? "";

                                cidade = cidades?.firstWhere(
                                  (e) => e.nome == cityName,
                                  orElse: () => cidades.first,
                                );

                                log(cidade.toString());
                                return DropdownButtonFormField<Cidade>(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      hintText: 'Selecione a cidade'),
                                  hint: const Text("Selecione sua cidade"),
                                  value: cidade,
                                  onChanged: (Cidade? value) {
                                    _cidade = value;
                                  },
                                  items: cidades?.map<DropdownMenuItem<Cidade>>(
                                      (Cidade value) {
                                    return DropdownMenuItem<Cidade>(
                                      value: value,
                                      child: Text(value.nome ?? ""),
                                    );
                                  }).toList(),
                                );
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFieldComponente(
                            hintText: 'Nome usuário',
                            obscureText: false,
                            controller: controllerUsername,
                            validator: (value) => validate(value),
                            keyboardType: TextInputType.text),
                        const SizedBox(height: 10),
                      ])),
                  const SizedBox(height: 20),

                  //botao de salvar
                  BotaoUniversal(
                    buttonText: 'Salvar',
                    onTapButton: () => usuarioAlterado(),
                  ),

                  //espaço
                  const SizedBox(height: 10),

                  //botao voltar
                  BotaoUniversal(
                      buttonText: 'Voltar',
                      onTapButton: () {
                        Navigator.of(context).pop();
                      }),
                ],
              );
          }
        });
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
                      goToMenu(context);
                    })
              ]);
        });
  }

  String _formatarData(DateTime? data) {
    String dia = data?.day.toString().padLeft(2, '0') ?? '00';
    String mes = data?.month.toString().padLeft(2, '0') ?? '00';
    String ano = data?.year.toString() ?? '0000';

    return '$dia/$mes/$ano';
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
    var user = await ParseUser.currentUser();

    final username = controllerUsername.text.trim();
    final cpf = controllerCPF.text.trim();
    final email = controllerEmail.text.trim();
    final telefone = controllerTelefone.text.trim();
    final dataNascimento = controllerDataNascimento.text.trim();
    final nome = controllerNome.text.trim();

    // transform datetime

    DateTime data = converterData(dataNascimento);

    user.set<String>("cpf", cpf);
    user.set<String>("telefone", telefone);
    user.set<String>("username", username);
    user.set<String>("email", email);
    user.set<DateTime>("dataNascimento", data);
    user.set<String>("nome", nome);
    user.set<Cidade>("cidadeId", _cidade ?? cidade);

    var response = await user.save();

    if (response.success) {
      showSuccess("Usuario alterado com sucesso!!");
    } else {
      showError("Algo ficou errado!!");
    }
  }

  DateTime converterData(String dataNascimento) {
    var list = dataNascimento.split('/');
    final dataFormatada = "${list[2]}-${list[1]}-${list[0]}";
    //log(dataFormatada);
    final data = DateTime.parse(dataFormatada);

    return data;
  }

  Future<List<Cidade>?> getCidades() async {
    return await cidadeController.getAllCidades();
  }
}
