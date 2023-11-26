import 'package:flutter/material.dart';
import 'package:med_facil/view/components/appbar_secundaria.dart';
import 'package:med_facil/view/components/botao_universal.dart';
import 'package:med_facil/view/components/textfild_componente.dart';
import 'package:med_facil/view/pages/menu.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class relatoriosocioControler extends StatefulWidget {
  @override
  State<relatoriosocioControler> createState() =>
      _relatoriosocioControlerState();
}

class _relatoriosocioControlerState extends State<relatoriosocioControler> {
  final _formkey = GlobalKey<FormState>();
  final controllerRendafamiliar = TextEditingController();
  final controllerRendaindividual = TextEditingController();
  final controllerQuantidadepessoa = TextEditingController();
  final controllerProfissao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const appbarRetornaMenu(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Relatorio socioeconômico',
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
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter)))),
                const SizedBox(height: 10),
                const Text(
                    'Informe seus dados socieconômicos para que possamos entender a sua realiade!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w400,
                        height: 0)),
                const SizedBox(height: 40),

                //formulario
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFieldComponente(
                          hintText: 'Quantas pessoas moram na sua casa?',
                          obscureText: false,
                          controller: controllerQuantidadepessoa,
                          validator: (value) => validate(value),
                          keyboardType: TextInputType.text),
                      const SizedBox(height: 40),
                      TextFieldComponente(
                          hintText: 'Renda familiar mensal bruta?',
                          obscureText: false,
                          validator: (value) => validate(value),
                          controller: controllerRendafamiliar,
                          keyboardType: TextInputType.text),
                      const SizedBox(height: 40),
                      TextFieldComponente(
                          hintText: 'Renda mensal individual bruta?',
                          obscureText: false,
                          controller: controllerRendaindividual,
                          validator: (value) => validate(value),
                          keyboardType: TextInputType.text),
                      const SizedBox(height: 40),
                      TextFieldComponente(
                          hintText: 'Qual sua profissão?',
                          obscureText: false,
                          controller: controllerProfissao,
                          validator: (value) => validate(value),
                          keyboardType: TextInputType.text),

                      const SizedBox(height: 55),

                      //botao 1
                      BotaoUniversal(
                          buttonText: 'Salvar', onTapButton: () => novo()),

                      //espaço
                      const SizedBox(height: 10),

                      //botao 2
                      BotaoUniversal(
                          buttonText: 'Voltar',
                          onTapButton: () {
                            Navigator.of(context).pop();
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
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
              title: const Text("Dados salvos!"),
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

  void novo() async {
    if (!_formkey.currentState!.validate()) {
      return;
    }
    final quantPessoa = controllerQuantidadepessoa.text.trim();
    final rendaFamilia = controllerRendafamiliar.text.trim();
    final rendaIndividual = controllerRendaindividual.text.trim();
    final profissao = controllerProfissao.text.trim();

    final relatorio = ParseObject('Relatorio');

    relatorio.set<int>("quantPessoa", int.parse(quantPessoa));
    relatorio.set<int>("rendaFamilia", int.parse(rendaFamilia));
    relatorio.set<int>("rendaIndividual", int.parse(rendaIndividual));
    relatorio.set<String>("profissao", profissao);

    var response = await relatorio.save();
    if (response.success) {
      showSuccess("Parabéns!");
    }
  }
}
