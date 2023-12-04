import 'package:flutter/material.dart';
import 'package:med_facil/view/components/appbar_secundaria.dart';
import 'package:med_facil/view/components/botao_universal.dart';
import 'package:med_facil/view/helpers/rout.helper.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class requisicaoController extends StatefulWidget {
  @override
  State<requisicaoController> createState() => _requisicaoControllerState();
}

List quant = [1, 2, 3];
List use = ["pre-datado", "continuo"];

final _formkey = GlobalKey<FormState>();
final controllernomeCompleto = TextEditingController();
final controllerQuantidade = TextEditingController();
final controllerUso = TextEditingController();

late String _nomeCompleto;
late int _quantidade;
late String _uso;

List<String> _items = []; // Lista para armazenar os itens do Dropdown
String? _selectedItem; // Item selecionado no Dropdown

class _requisicaoControllerState extends State<requisicaoController> {
  @override
  void initState() {
    super.initState();
    _fetchDataFromBack4App(); // Inicializa o carregamento dos dados do Back4App
  }

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

                //aqui é feito o formulario para a realização da requisição a qual o usuário deseja referente a um medicamento
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
                        hint: const Text(
                          "Selecione o medicamento ",
                          softWrap: true,
                          style: TextStyle(color: Colors.black),
                        ),
                        value: _selectedItem,
                        items: _items.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedItem = value!;
                          });
                        },
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
                      goToMenu(context);
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

  void nova() async {
    var currentUser = await ParseUser.currentUser();

    if (currentUser != null) {
      final medicamento = ParseObject('Pedido');

      medicamento.set<ParseUser>("cidadaoId", currentUser);
      medicamento.set<String?>("remedio", _selectedItem);
      medicamento.set<int>("quantidade", _quantidade);
      medicamento.set<String>("uso", _uso);

      var response = await medicamento.save();
      if (response.success) {
        showSuccess("Parabéns!");
      } else {
        showError("Erro ao cadastrar a requisição.");
      }
    } else {
      // O usuário não está logado, exiba uma mensagem de erro ou redirecione para a página de login.
      showError("Usuário não está logado.");
    }
  }

  Future<void> _fetchDataFromBack4App() async {
    final query = QueryBuilder(ParseObject('Medicamentos'))..setLimit(1000);
    try {
      final response = await query.query();
      if (response.success && response.results != null) {
        setState(() {
          _items = response.results!
              .map((obj) => obj['nomeMedicamento'].toString())
              .toList();
        });
      } else {
        print('Error fetching data from Back4App: ${response.error}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
