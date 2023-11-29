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

class cadastroController extends StatefulWidget {
  @override
  _CadastroControllerState createState() => _CadastroControllerState();
}

class _CadastroControllerState extends State<cadastroController> {
  List lista = ["Ceres", "Rialma", "Itapaci", "Aparecida"];

  final _formkey = GlobalKey<FormState>();
  final controllerUsername = TextEditingController();
  final controllerCPF = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerTelefone = TextEditingController();
  final controllerDataNascimento = TextEditingController();
  final controllerNome = TextEditingController();
  final controllerPassword = TextEditingController();

  late Future<List<Cidade>?>? cidadeList;

  final cidadeController = CidadeController();

  Cidade? _cidade;

  @override
  void initState() {
    super.initState();
    cidadeList = getCidades();
  }

  @override
  Widget build(BuildContext context) {
    return

        //formulario
        Form(
      key: _formkey,
      child: Column(
        children: [
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
              keyboardType: TextInputType.text),
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
                  return DropdownButtonFormField<Cidade>(
                    decoration: const InputDecoration(
                      labelText: "Cidade",
                    ),
                    hint: const Text("Selecione sua cidade"),
                    onChanged: (Cidade? value) {
                      _cidade = value;
                    },
                    items:
                        cidades?.map<DropdownMenuItem<Cidade>>((Cidade value) {
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
          TextFieldComponente(
              hintText: 'Senha',
              obscureText: false,
              controller: controllerPassword,
              validator: (value) => validate(value),
              keyboardType: TextInputType.text),

          const SizedBox(height: 20),

          //botões
          BotaoUniversal(
              buttonText: 'Salvar', onTapButton: () => novoUsuario()),
          const SizedBox(height: 10),
          BotaoUniversal(
            buttonText: 'Voltar',
            onTapButton: () {
              Navigator.of(context).pop();
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
                      goToLogin(context);
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
    final nome = controllerNome.text.trim();
    final password = controllerPassword.text.trim();

    final user = ParseUser.createUser(username, password, email);

    // transform datetime

    DateTime data = converterData(dataNascimento);

    user.set<String>("cpf", cpf);
    user.set<String>("telefone", telefone);
    user.set<DateTime>("dataNascimento", data);
    user.set<Cidade?>("cidadeId", _cidade);
    user.set<String>("nome", nome);

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

  Future<List<Cidade>?> getCidades() async {
    return await cidadeController.getAllCidades();
  }
}
