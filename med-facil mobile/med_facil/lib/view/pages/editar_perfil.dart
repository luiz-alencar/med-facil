import 'package:flutter/material.dart';
import 'package:med_facil/view/components/appbar_secundaria.dart';
import 'package:med_facil/view/controller/editar.dart';

class Editarperfil extends StatefulWidget {
  const Editarperfil({super.key});

  @override
  State<Editarperfil> createState() => _EditarperfilState();
}

class _EditarperfilState extends State<Editarperfil> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbarRetornaMenu(),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      

                      //formulario

                      UserScreen(),
                      
                      
                    ]
                    )
                  )
                )
              )
            );
  }
}