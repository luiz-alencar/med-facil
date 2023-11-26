import 'package:flutter/material.dart';
import 'package:med_facil/view/controller/relatoriosocioController.dart';

class RelatorioSocioeconomicoPage extends StatefulWidget {
  const RelatorioSocioeconomicoPage({super.key});

  @override
  State<RelatorioSocioeconomicoPage> createState() =>
      _RelatorioSocioeconomicoState();
}

class _RelatorioSocioeconomicoState extends State<RelatorioSocioeconomicoPage> {
  @override
  Widget build(BuildContext context) {
    return
        //page
        relatoriosocioControler();
  }
}
