import 'package:flutter/material.dart';
import 'package:med_facil/view/components/appbar_paramenu.dart';
import 'package:med_facil/view/components/botao_universal.dart';
import 'package:med_facil/view/pages/menu.dart';

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
                    const Text(
                      'Editar perfil',
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
                        color: Color(0xFF304D63),
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
                      'Edite suas informações!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Form(
                        child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                              label: Text('Nome completo.'),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)))),
                        ),
                        SizedBox(height: 10),
                        TextField(
                            decoration: InputDecoration(
                                label: Text('CPF.'),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12))))),
                        SizedBox(height: 10),
                        TextField(
                            decoration: InputDecoration(
                                label: Text('E-mail.'),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12))))),
                        SizedBox(height: 10),
                        TextField(
                            decoration: InputDecoration(
                                label: Text('Telefone.'),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12))))),
                        SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                              label: Text('Data de nascimento.'),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)))),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                              label: Text('Cidade'),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)))),
                        ),
                        SizedBox(height: 10),
                        TextField(
                            decoration: InputDecoration(
                                label: Text('Login.'),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12))))),
                        SizedBox(height: 10),
                        TextField(
                            decoration: InputDecoration(
                                label: Text('Senha.'),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)))))
                      ],
                    )),
                    const SizedBox(height: 20),
                    BotaoUniversal(
                        buttonText: 'Salvar',
                        onTapButton: () {
                          Navigator.of(context).pop();
                        }),
                  ]),
            ),
          ),
        ));
  }
}
