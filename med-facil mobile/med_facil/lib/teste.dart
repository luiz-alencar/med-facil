import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exemplo GridView Centralizado'),
        ),
        body: Center(
          child: MyGridView(),
        ),
      ),
    );
  }
}

class MyGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(200),
      crossAxisCount: 2, // Número de colunas
      mainAxisSpacing: 10.0, // Espaçamento vertical entre os itens
      crossAxisSpacing: 0, // Espaçamento horizontal entre os itens
      children: <Widget>[
        buildContainer(1, 'Editar\nPerfil', 'assets/images/imagem5.png'),
        buildContainer(2, 'Medicamentos\nDisponíveis', 'assets/images/imagem2.png'),
        buildContainer(3, 'Requisição de\nMedicamentos', 'assets/images/imagem1.png'),
        buildContainer(4, 'Minhas\nRequisições', 'assets/images/imagem3.png'),
        buildContainer(5, 'Relatório\nSocioeconômico', 'assets/images/imagem4.png'),
      ],
    );
  }

  Widget buildContainer(int index, String text, String assetPath) {
    return Container(
      width: 159,
      height: 160,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 14.22,
            child: Container(
              width: 159,
              height: 145.78,
              decoration: BoxDecoration(
                color: Color(0xFF304D63),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 159,
              height: 152.89,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1, color: Color(0xFF304D63)),
              ),
            ),
          ),
          Positioned(
            left: 28,
            top: 87,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF304D63),
                fontSize: 18,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            left: 50,
            top: 16,
            child: Container(
              width: 60,
              height: 60,
              child: SizedBox(
                child: Image.asset(assetPath),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
