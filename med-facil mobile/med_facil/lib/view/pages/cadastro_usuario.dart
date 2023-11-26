import 'package:flutter/material.dart';
import 'package:med_facil/view/components/titulo_imagem.dart';
import 'package:med_facil/view/controller/cadastroController.dart';

class CadastroUsuarioPage extends StatefulWidget {
  const CadastroUsuarioPage({super.key});

  @override
  State<CadastroUsuarioPage> createState() => _CadastroUsuarioPageState();
}

class _CadastroUsuarioPageState extends State<CadastroUsuarioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //imagem
                  const TituloImagem(),

                  //formulario
                  cadastroController(),
                ]),
          ),
        ),
      ),
    );
  }
}
