// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:med_facil/view/components/appbar_secundaria.dart';
import 'package:med_facil/view/components/botao_universal.dart';
import 'package:med_facil/view/components/buscar_medicamento.dart';
import 'package:url_launcher/url_launcher.dart';

class MedicamentosDisponiveisPage extends StatefulWidget {
  const MedicamentosDisponiveisPage({super.key});

  @override
  State<MedicamentosDisponiveisPage> createState() =>
      _MedicamentosDisponiveisPageState();
}

class _MedicamentosDisponiveisPageState
    extends State<MedicamentosDisponiveisPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const appbarRetornaMenu(),
      body: Center(
        child: Column(
          children: [
            const Text('Medicamentos Disponíveis ',
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
            const SizedBox(height: 40),
            const SizedBox(
                width: 328,
                height: 84,
                child: Text(
                    'Olá, aqui você encontra uma lista com todos os medicamentos cadastrados no Sistema Único de Saúde (SUS)!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w400,
                        height: 0))),

            //faz a lista dos medicamentos!
            const Expanded(
              child: MedicamentosListView(),
            ),

            //link
            GestureDetector(
                onTap: () {
                  const url =
                      'https://www.gov.br/saude/pt-br/composicao/sectics/daf/relacao-nacional-de-medicamentos-essenciais';
                  launch(url);
                },
                child: const Text('Clique aqui para visitar o site',
                    style: TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        color: Colors.blue))),
            const SizedBox(height: 22),

            //botoes
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
