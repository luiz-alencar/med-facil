// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:med_facil/teste3.dart';
import 'package:med_facil/view/components/botao_universal.dart';
import 'package:med_facil/view/pages/menu.dart';
import 'package:url_launcher/url_launcher.dart';

class MedicamentosDisponiveisPage extends StatefulWidget {
  const MedicamentosDisponiveisPage({super.key});

  @override
  State<MedicamentosDisponiveisPage> createState() =>
      _MedicamentosDisponiveisPageState();
}

class _MedicamentosDisponiveisPageState
    extends State<MedicamentosDisponiveisPage> {
  List<Medicamento> filteredMedicamento = [];
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
            'Medicamentos Disponíveis ',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF304D63),
              fontSize: 24,
              fontFamily: 'Palanquin Dark',
              fontWeight: FontWeight.w700,
              height: 2.5,
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
          SizedBox(
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
                height: 0,
              ),
            ),
          ),
          SizedBox(
            width: 328,
            height: 84,
            child: TextField(
              onChanged: (text) {
                // Atualize a lista de frutas filtradas com base na entrada do usuário
                setState(() {
                  filteredMedicamento = medicamentos
                      .where((medicamento) => medicamento.nome
                          .toLowerCase()
                          .contains(text.toLowerCase()))
                      .toList();
                });
              },
              decoration: InputDecoration(
                labelText: 'Pesquisar',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredMedicamento.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredMedicamento[index].nome),
                  subtitle: Text('Dosagem: ${medicamentos[index].dosagem}'),
                );
              },
            ),
          ),
          InkWell(
            onTap: () {
              _launchPDF();
            },
            child: Text(
              'Clique aqui para abrir o PDF',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(height: 22),
          BotaoUniversal(
              buttonText: 'Voltar',
              onTapButton: () {
                Navigator.of(context).pop();
              })
        ])));
  }

  _launchPDF() async {
    const pdfURL =
        'https://www.caceres.mt.gov.br/fotos_institucional_downloads/2.pdf'; // Substitua pelo URL do seu arquivo PDF
    if (await canLaunch(pdfURL)) {
      await launch(pdfURL);
    } else {
      throw 'Não foi possível abrir o PDF';
    }
  }
}
