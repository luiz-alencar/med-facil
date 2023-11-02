import 'package:flutter/material.dart';
import 'package:med_facil/view/components/botao_universal.dart';
import 'package:med_facil/view/components/textfild_componente.dart';
import 'package:med_facil/view/pages/menu.dart';
import 'package:non_uniform_border/non_uniform_border.dart';

class Relatorio_socioeconomicoPage extends StatefulWidget {
  const Relatorio_socioeconomicoPage({super.key});

  @override
  State<Relatorio_socioeconomicoPage> createState() =>
      _Relatorio_socioeconomicoState();
}

class _Relatorio_socioeconomicoState
    extends State<Relatorio_socioeconomicoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: const Text('Med-Fácil',
                  style: TextStyle(color: Colors.white))),

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
            padding: const EdgeInsets.all(35.0),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'teste 1',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF304D63),
                        fontSize: 24,
                        fontFamily: 'Palanquin Dark',
                        fontWeight: FontWeight.w700,
                        height: 0,
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
                    const SizedBox(height: 40),
                    const Form(
                        child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)))),
                        ),
                        const SizedBox(height: 40),
                        TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12))))),
                        const SizedBox(height: 40),
                        TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12))))),
                        const SizedBox(height: 40),
                        TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)))))
                      ],
                    )),
                    const SizedBox(height: 35),
                    BotaoUniversal(
                        buttonText: 'Salvar',
                        onTapButton: () {
                          Navigator.of(context).pop();
                        }),
                    const SizedBox(height: 10),
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
