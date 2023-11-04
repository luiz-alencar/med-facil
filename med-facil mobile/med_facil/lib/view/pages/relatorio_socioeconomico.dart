import 'package:flutter/material.dart';
import 'package:med_facil/view/components/botao_universal.dart';
import 'package:med_facil/view/pages/menu.dart';

class RelatorioSocioeconomicoPage extends StatefulWidget {
  const RelatorioSocioeconomicoPage({super.key});

  @override
  State<RelatorioSocioeconomicoPage> createState() =>
      _RelatorioSocioeconomicoState();
}

class _RelatorioSocioeconomicoState extends State<RelatorioSocioeconomicoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text('Med-Fácil', style: TextStyle(color: Colors.white))),

          //Utilizamos o TextStyle para alterar o texto
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
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Relatorio socioeconômico',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF304D63),
                        fontSize: 24,
                        fontFamily: 'Palanquin Dark',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 10),
                    const Text(
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
                    const SizedBox(height: 40),
                    const Form(
                        child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                              label: Text('Quantas pessoas moram na sua casa?'),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)))),
                        ),
                        SizedBox(height: 40),
                        TextField(
                            decoration: InputDecoration(
                                label: Text('Renda familiar mensal bruta?'),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12))))),
                        SizedBox(height: 40),
                        TextField(
                            decoration: InputDecoration(
                                label: Text('Renda individual mensal bruta?'),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12))))),
                        SizedBox(height: 40),
                        TextField(
                            decoration: InputDecoration(
                                label: Text('Qual sua Profissão?'),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)))))
                      ],
                    )),
                    const SizedBox(height: 55),
                    BotaoUniversal(
                        buttonText: 'Salvar',
                        onTapButton: () {
                          Navigator.of(context).pop();
                        }),
                    const SizedBox(height: 20),
                    BotaoUniversal(
                        buttonText: 'Voltar',
                        onTapButton: () {
                          Navigator.of(context).pop();
                        })
                  ]),
            ),
          ),
        ));
  }
}
