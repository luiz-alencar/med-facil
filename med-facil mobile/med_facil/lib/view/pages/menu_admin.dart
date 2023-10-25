import 'package:flutter/material.dart';
import 'package:med_facil/view/pages/login.dart';

class MenuAdminPage extends StatefulWidget {
  const MenuAdminPage({super.key});

  @override
  State<MenuAdminPage> createState() => _MenuAdminPageState();
}

class _MenuAdminPageState extends State<MenuAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Med-Fácil", style: TextStyle(color: Colors.white)), //Utilizamos o TextStyle para alterar o texto
        backgroundColor: const Color.fromRGBO(48, 77, 99, 1),
        elevation: 0,
        leading: SizedBox(
          child: Image.asset('assets/images/logo2.png'),
        ),
        actions: [IconButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        }, icon: const Icon(Icons.logout, color: Colors.white))],  //Podemos utilizar a ação onPressed para chamar uma função
      ),
      body: Center(
        child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [     
                SizedBox(
                  width: 300,
                  height: 300,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 26.67,
                        child: Container(
                          width: 300,
                          height: 273.33,
                          decoration: ShapeDecoration(
                            color: Color(0xFF304D63),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 300,
                          height: 286.67,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: Color(0xFF304D63)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 70,
                        top: 163,
                        child: SizedBox(
                          width: 161,
                          height: 86,
                          child: Text(
                            'Baixar Relatório Completo',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF304D63),
                              fontSize: 24,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 100,
                        top: 42,
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 10.34,
                                      top: 7.14,
                                      child: Container(
                                        width: 82.76,
                                        height: 85.71,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 82.76,
                                              height: 85.71,
                                            child: SizedBox(
                                              child: Image.asset('assets/images/imagem6.png'),
                                            ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]
            )
          )
        )
      ),
    );
  }
}