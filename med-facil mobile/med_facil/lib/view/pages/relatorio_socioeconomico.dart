import 'package:flutter/material.dart';
import 'package:med_facil/view/pages/menu.dart';
import 'package:non_uniform_border/non_uniform_border.dart';

class Relatorio_socioeconomicoPage extends StatefulWidget {
  const Relatorio_socioeconomicoPage({super.key});

  @override
  State<Relatorio_socioeconomicoPage> createState() =>
      _Relatorio_socioeconomicoState();
}

class _Relatorio_socioeconomicoState extends State<Relatorio_socioeconomicoPage> {
  Object? teste;
  List lista = ["1", "2", "3"];
  final shapeBorder = NonUniformBorder(
    leftWidth: 1,
    rightWidth: 1,
    topWidth: 1,
    bottomWidth: 4,
    color: Color.fromRGBO(48, 77, 99, 100),
    strokeAlign: BorderSide.strokeAlignCenter,
    borderRadius: BorderRadius.circular(12)
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Med-Fácil",
            style: TextStyle(
                color: Colors
                    .white)), //Utilizamos o TextStyle para alterar o texto
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
        ], //Podemos utilizar a ação onPressed para chamar uma função
      ),
      body: Center(
        child: Column(children: [
          Text(
            'Relatório Socioeconômico',
            style: TextStyle(
              color: Color(0xFF304D63),
              fontSize: 28,
              fontFamily: 'Palanquin Dark',
              fontWeight: FontWeight.w700,
              height: 2.5,
            ),
          ),
          Container(
            width: 328,
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
            width: 318,
            height: 49,
            child: Text(
              'Informe seus dados socieconômicos para que possamos entender a sua realiade!',
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
            child: DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              hint: const Text("Quantas pessoas moram na sua casa", style: TextStyle(color: Colors.black)),
              value: teste,
              onChanged: (newValue) {
                setState(() {
                  teste = newValue;
                });
              },
              items: lista.map((valueItem) {
                return DropdownMenuItem(
                    value: valueItem, child: Text(valueItem));
              }).toList(),
            ),
          ),
          const SizedBox(height: 35),
          Container(
            width: 328,
            decoration: ShapeDecoration(
              shape: shapeBorder,
            ),
            child: DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              hint: const Text("Renda familiar mensal", style: TextStyle(color: Colors.black)),
              value: teste,
              onChanged: (newValue) {
                setState(() {
                  teste = newValue;
                });
              },
              items: lista.map((valueItem) {
                return DropdownMenuItem(
                    value: valueItem, child: Text(valueItem));
              }).toList(),
            ),
          ),
          const SizedBox(height: 35),
          Container(
            width: 328,
            decoration: ShapeDecoration(
              shape: shapeBorder,
            ),
            child: DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              hint: const Text("Renda idividual", style: TextStyle(color: Colors.black)),
              value: teste,
              onChanged: (newValue) {
                setState(() {
                  teste = newValue;
                });
              },
              items: lista.map((valueItem) {
                return DropdownMenuItem(
                    value: valueItem, child: Text(valueItem));
              }).toList(),
            ),
          ),
          const SizedBox(height: 35),
          Container(
            width: 328,
            decoration: ShapeDecoration(
              shape: shapeBorder,
            ),
            child: DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              hint: const Text("Sua profissão", style: TextStyle(color: Colors.black)),
              value: teste,
              onChanged: (newValue) {
                setState(() {
                  teste = newValue;
                });
              },
              items: lista.map((valueItem) {
                return DropdownMenuItem(
                    value: valueItem, child: Text(valueItem));
              }).toList(),
            ),
          ),
          const SizedBox(height: 50),
          Container(
            width: 344,
            height: 44,
              child: TextButton(
              onPressed: () {
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MenuPage()),
            );}, child: Text('Salvar', style: TextStyle(fontSize: 20, color: Colors.white)),),
            decoration: ShapeDecoration(
              color: Color(0xFF304D63),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),)
          ),
          const SizedBox(height: 22),
          Container(
            width: 344,
            height: 44,
              child: TextButton(
              onPressed: () {
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MenuPage()),
            );}, child: Text('Voltar', style: TextStyle(fontSize: 20, color: Colors.white)),),
            decoration: ShapeDecoration(
              color: Color(0xFF304D63),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),)
          ),
        ]),
      ),
    );
  }
}
