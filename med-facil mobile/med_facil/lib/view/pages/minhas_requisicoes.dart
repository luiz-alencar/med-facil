// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:med_facil/view/components/botao_universal.dart';
import 'package:med_facil/view/pages/menu.dart';
import 'package:non_uniform_border/non_uniform_border.dart';

class MinhasRequisicoesPage extends StatefulWidget {
  const MinhasRequisicoesPage({super.key});

  @override
  State<MinhasRequisicoesPage> createState() => _MinhasRequisicoesPageState();
}

class _MinhasRequisicoesPageState extends State<MinhasRequisicoesPage> {
  Object? teste;
  List lista = ["remedio", "dipirona", "continuo"];
  final shapeBorder = NonUniformBorder(
      leftWidth: 1,
      rightWidth: 1,
      topWidth: 1,
      bottomWidth: 4,
      color: Color.fromRGBO(48, 77, 99, 100),
      strokeAlign: BorderSide.strokeAlignCenter,
      borderRadius: BorderRadius.circular(12));
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MenuPage()),
                );
              },
              icon: const Icon(Icons.house, color: Colors.white))
        ],
      ),
      body: Center(
          child: Column(children: [
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
            'Acompanhe suas requisições',
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
        Container(
          width: 328,
          decoration: ShapeDecoration(
            shape: shapeBorder,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(child: Text("Requisição 01")),
              SizedBox(width: 170), // Espaço entre o ícone e o texto
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  // Mostrar um AlertDialog quando o ícone de adição for pressionado
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Alerta'),
                        content: Text('Requsição 01'),
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
        const SizedBox(height: 35),
        Container(
          width: 328,
          decoration: ShapeDecoration(
            shape: shapeBorder,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(child: Text("Requisição 02")),
              SizedBox(width: 170), // Espaço entre o ícone e o texto
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  // Mostrar um AlertDialog quando o ícone de adição for pressionado
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Alerta'),
                        content: Text('Requsição 02'),
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
        const SizedBox(height: 35),
        Container(
          width: 328,
          decoration: ShapeDecoration(
            shape: shapeBorder,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(child: Text("Requisição 03")),
              SizedBox(width: 170), // Espaço entre o ícone e o texto
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  // Mostrar um AlertDialog quando o ícone de adição for pressionado
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Alerta'),
                        content: Text('Requsição 03'),
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
        const SizedBox(height: 50),
        BotaoUniversal(
          buttonText: 'Voltar',
          onTapButton: () {
            Navigator.of(context).pop();
          },
        )
      ])),
    );
  }
}
