// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:med_facil/view/components/appbar_secundaria.dart';
import 'package:med_facil/view/components/botao_universal.dart';
import 'package:non_uniform_border/non_uniform_border.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class MinhasRequisicoesPage extends StatefulWidget {
  const MinhasRequisicoesPage({super.key});

  @override
  State<MinhasRequisicoesPage> createState() => _MinhasRequisicoesPageState();
}

class _MinhasRequisicoesPageState extends State<MinhasRequisicoesPage> {
  //decoração do campo de requisição
  final shapeBorder = NonUniformBorder(
      leftWidth: 1,
      rightWidth: 1,
      topWidth: 1,
      bottomWidth: 4,
      color: Color.fromRGBO(48, 77, 99, 100),
      strokeAlign: BorderSide.strokeAlignCenter,
      borderRadius: BorderRadius.circular(12));
  List<ParseObject> pedidos = [];

  @override
  void initState() {
    super.initState();
    fetchPedidos();
  }

  // aqui realiza toda a busca dos pedidos referente ao usuario que está logado
  Future<void> fetchPedidos() async {
    var currentUser = await ParseUser.currentUser();

    if (currentUser != null) {
      var queryBuilder = QueryBuilder<ParseObject>(ParseObject('Pedido'))
        ..whereEqualTo('cidadaoId', currentUser)
        ..orderByDescending('createdAt');

      var response = await queryBuilder.query();

      if (response.success && response.results != null) {
        setState(() {
          pedidos = response.results as List<ParseObject>;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarRetornaMenu(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Minhas Requisições',
                style: TextStyle(
                  color: Color(0xFF304D63),
                  fontSize: 32,
                  fontFamily: 'Palanquin Dark',
                  fontWeight: FontWeight.w700,
                  height: 2,
                ),
              ),
              Container(
                width: 318,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              SizedBox(
                width: 221,
                height: 24,
                child: Text(
                  'Veja as suas requisições',
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
              const SizedBox(height: 35),

              if (pedidos.isEmpty)
                Center(
                  child: Text(
                    'Você não possui nenhuma requisição.',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              else
                // Exibição dinâmica dos pedidos, onde cada pedido aparecera em um card especifico para ele.
                for (int i = 0; i < pedidos.length; i++)
                  buildPedidoContainer(pedidos[i], i + 1),
        
              //botao voltar
              const SizedBox(height: 50),
              BotaoUniversal(
                buttonText: 'Voltar',
                onTapButton: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildPedidoContainer(ParseObject pedido, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35.0),
      child: Container(
        width: 328,
        decoration: ShapeDecoration(
          shape: shapeBorder,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(child: Text("Requisição $index")),
            SizedBox(width: 170),
            // Espaço entre o ícone e o texto
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // Mostrar um AlertDialog quando o ícone de adição for pressionado
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Requisição $index"),
                      content: Container(
                        height: 70, // Ajuste o tamanho conforme necessário
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Remédio: ${pedido['remedio']}'),
                            SizedBox(height: 5,),
                            Text('Quantidade: ${pedido['quantidade']}', style: TextStyle(
                                    fontSize: 14, // Tamanho do subtítulo
                                    fontWeight: FontWeight.normal,
                                  ),),
                            SizedBox(height: 5,),
                            Text('Uso: ${pedido['uso']}', style: TextStyle(
                                    fontSize: 14, // Tamanho do subtítulo
                                    fontWeight: FontWeight.normal,
                                  ),),
                            // Adicione outros campos conforme necessário
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Fechar'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
