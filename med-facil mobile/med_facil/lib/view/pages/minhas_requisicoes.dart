// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:med_facil/view/components/appbar_secundaria.dart';
import 'package:med_facil/view/components/botao_universal.dart';
import 'package:non_uniform_border/non_uniform_border.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarRetornaMenu(),
      body: Center(
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

            //requisição 1
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

            //requisição2
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

            //requisição 3
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
    );
  }
}
