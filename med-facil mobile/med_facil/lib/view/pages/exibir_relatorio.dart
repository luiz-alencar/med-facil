import 'package:flutter/material.dart';
import 'package:med_facil/view/components/botao_universal.dart';
import 'package:med_facil/view/controller/relatorioController.dart';
import 'package:med_facil/view/helpers/rout.helper.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class exibirRelatorioPage extends StatefulWidget {
  const exibirRelatorioPage({super.key});

  @override
  State<exibirRelatorioPage> createState() => _exibirRelatorioPageState();
}

class _exibirRelatorioPageState extends State<exibirRelatorioPage> {
  List<ParseObject> filteredPedidos = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text('Med-Fácil',
                  style: TextStyle(
                      color: Colors
                          .white))), //Utilizamos o TextStyle para alterar o texto
          backgroundColor: const Color.fromRGBO(48, 77, 99, 1),
          elevation: 0,
          leading: SizedBox(
            child: Image.asset('assets/images/logo2.png'),
          ),
          actions: [
            IconButton(
                onPressed: () => goToMenuAdmin(context),
                icon: const Icon(Icons.house, color: Colors.white))
          ], //Podemos utilizar a ação onPressed para chamar uma função
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
              child: Column(children: [
            const Text('Relatório de Medicamentos ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF304D63),
                    fontSize: 24,
                    fontFamily: 'Palanquin Dark',
                    fontWeight: FontWeight.w700,
                    height: 2.5)),
            Container(
                width: 318,
                decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter)))),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<ParseObject>>(
                future: buscarPedido(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SizedBox(
                          width: 200,
                          height: 200,
                          child: CircularProgressIndicator(
                            color: Color(0xFF304D63),
                          )),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Erro: ${snapshot.error}');
                  } else {
                    List<ParseObject> pedidos = snapshot.data!;
                    // Agrupe os pedidos por remédio e some as quantidades
                    Map<String, int> medicamentoQuantidades = {};
                    for (var pedido in pedidos) {
                      var remedio = pedido.get('remedio')?.toString() ??
                          'Remedio Desconhecido';
                      var quantidade = pedido.get('quantidade') as int;
                      medicamentoQuantidades[remedio] =
                          (medicamentoQuantidades[remedio] ?? 0) + quantidade;
                    }

                    // Crie uma lista de objetos contendo remedio e quantidade
                    filteredPedidos = medicamentoQuantidades.entries
                        .map((entry) => ParseObject('Pedido')
                          ..set('remedio', entry.key)
                          ..set('quantidade', entry.value))
                        .toList();

                    return ListView.builder(
                      // exibe todos os remedios pedidos por usuarios normais, onde cada remedio terá sua quantidade somada junto do seu nome
                      itemCount: filteredPedidos.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                              '${filteredPedidos[index].get('remedio')} - Quantidade: ${filteredPedidos[index].get('quantidade')}'),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            BotaoUniversal(
                buttonText: 'Voltar',
                onTapButton: () {
                  Navigator.of(context).pop();
                })
          ])),
        ));
  }
}
