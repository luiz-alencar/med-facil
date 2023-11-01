import 'package:flutter/material.dart';

class TituloImagem extends StatelessWidget {
  const TituloImagem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Ícone do Sistema
        ClipRRect(
          child: Image.asset(
            'assets/images/logo.png',
          ),
        ),

        //Espaço em branco
        const SizedBox(height: 10),

        const Text("MEDFACIL", style: TextStyle(fontSize: 30)),
        //Espaço em branco

        const SizedBox(height: 10),

        //Espaço em branco
        const Text("Remédios na medida certa", style: TextStyle(fontSize: 18)),

        //Espaço em branco
        const SizedBox(height: 10),
      ],
    );
  }
}
