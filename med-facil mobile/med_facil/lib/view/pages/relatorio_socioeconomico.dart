import 'package:flutter/material.dart';
import 'package:med_facil/view/pages/login.dart';

class Relatorio_socioeconomico extends StatefulWidget {
  const Relatorio_socioeconomico({super.key});

  @override
  State<Relatorio_socioeconomico> createState() =>
      _Relatorio_socioeconomicoState();
}

class _Relatorio_socioeconomicoState extends State<Relatorio_socioeconomico> {
  Object? teste;
  List lista = ["1", "2", "3"];
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
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              icon: const Icon(Icons.logout, color: Colors.white))
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
                color: Colors.black.withOpacity(0.5),
                fontSize: 16,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
          const SizedBox(height: 35),
          SizedBox(
            width: 328,
            child: DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              hint: const Text("Quantas pessoas moram na sua casa"),
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
          SizedBox(
            width: 328,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Renda familiar mensal",
              ),
            ),
          ),
          const SizedBox(height: 35),
          SizedBox(
            width: 328,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Renda idividual",
              ),
            ),
          ),
          const SizedBox(height: 35),
          SizedBox(
            width: 328,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Sua profissão",
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
