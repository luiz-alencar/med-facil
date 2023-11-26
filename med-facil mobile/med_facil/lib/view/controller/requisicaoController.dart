import 'package:flutter/material.dart';
import 'package:med_facil/view/components/appbar_secundaria.dart';
import 'package:med_facil/view/components/botao_universal.dart';
import 'package:med_facil/view/pages/menu.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class requisicaoController extends StatefulWidget {
  @override
  State<requisicaoController> createState() => _requisicaoControllerState();
}

List reme = ["Dipirona", "Anador", "Doralgina"];
List quant = [1, 2, 3];
List use = ["pre-datado", "continuo"];

final _formkey = GlobalKey<FormState>();
final controllernomeCompleto = TextEditingController();
final controllerQuantidade = TextEditingController();
final controllerUso = TextEditingController();

late String _nomeCompleto;
late int _quantidade;
late String _uso;

class _requisicaoControllerState extends State<requisicaoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarRetornaMenu(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Requisição de Medicamentos',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF304D63),
                    fontSize: 24,
                    fontFamily: 'Palanquin Dark',
                    fontWeight: FontWeight.w700,
                    height: 2.5,
                  ),
                ),
                Container(
                  width: 318,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const SizedBox(
                  width: 328,
                  height: 84,
                  child: Text(
                    'Olá, aqui você deverá gerar suas requisições, apresente nos campos abaixo informações sobre sua requisição de medicamentos e informe suas necessidades!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                //form
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      //select 1
                      DropdownButtonFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                        ),
                        hint: const Text("Selecione o Medicamento ",
                            style: TextStyle(color: Colors.black)),
                        onChanged: (newValue) {
                          setState(() {
                            _nomeCompleto = newValue as String;
                          });
                        },
                        items: reme.map((valueItem) {
                          return DropdownMenuItem(
                              value: valueItem, child: Text(valueItem));
                        }).toList(),
                      ),

                      //espaço
                      const SizedBox(height: 25),

                      //espaço

                      //select 2
                      DropdownButtonFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                        ),
                        hint: const Text("Selecione a Quantidade ",
                            style: TextStyle(color: Colors.black)),
                        onChanged: (newValue) {
                          setState(() {
                            _quantidade = newValue as int;
                          });
                        },
                        items: quant.map((valueItem) {
                          return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem.toString()));
                        }).toList(),
                      ),

                      //espaço
                      const SizedBox(height: 25),

                      //espaço

                      //select 3
                      DropdownButtonFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                        ),
                        hint: const Text("Selecione o Uso ",
                            style: TextStyle(color: Colors.black)),
                        onChanged: (newValue) {
                          setState(() {
                            _uso = newValue as String;
                          });
                        },
                        items: use.map((valueItem) {
                          return DropdownMenuItem(
                              value: valueItem, child: Text(valueItem));
                        }).toList(),
                      ),

                      //espaço
                      const SizedBox(height: 50),

                      //botao 1
                      BotaoUniversal(
                          buttonText: 'Enviar', onTapButton: () => nova()),

                      //espaço
                      const SizedBox(height: 10),

                      //botao 2
                      BotaoUniversal(
                          buttonText: 'Voltar',
                          onTapButton: () {
                            Navigator.of(context).pop();
                          })
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
              title: const Text("Requisição cadastrada!"),
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

  void nova() async {
    final medicamento = ParseObject('Medicamentos');

    medicamento.set<String>("nomeCompleto", _nomeCompleto);
    medicamento.set<int>("quantidade", _quantidade);
    medicamento.set<String>("uso", _uso);

    var response = await medicamento.save();
    if (response.success) {
      showSuccess("Parabéns!");
    }
  }
}
