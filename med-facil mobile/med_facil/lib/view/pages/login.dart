import 'package:flutter/material.dart';
import 'package:med_facil/view/pages/cadastro_usuario.dart';
import 'package:med_facil/view/pages/menu.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Material(  
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [     
                SizedBox(
                  width: 95,
                  height: 71,
                  child: Image.asset('assets/images/logo.png'),
                ),
                const SizedBox(height: 10),
                const Text("MEDFACIL", style: TextStyle(fontSize: 30)),
                const SizedBox(height: 10),
                const Text("Remédios na medida certa", style: TextStyle(fontSize: 18)),           
                const SizedBox(height: 10),
                const SizedBox(
                  width: 344,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Login",
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  width: 344,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Senha",
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
              width: 344,
              height: 44,
                child: TextButton(
                onPressed: () {
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MenuPage()),
              );}, child: Text('Entrar', style: TextStyle(fontSize: 20, color: Colors.white)),),
              decoration: ShapeDecoration(
                color: Color(0xFF304D63),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),)
              ),
                const SizedBox(height: 10),
                Container(
                  width: 324,
                  height: 20,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 12,
                        child: Container(
                          width: 147,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 177,
                        top: 12,
                        child: Container(
                          width: 147,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 154,
                        top: 0,
                        child: Text(
                          'ou',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
              width: 344,
              height: 44,
                child: TextButton(
                onPressed: () {
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CadastroUsuarioPage()),
              );}, child: Text('Cadastre-se', style: TextStyle(fontSize: 20, color: Colors.white)),),
              decoration: ShapeDecoration(
                color: Color(0xFF304D63),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),)
              ),
              ],
            ),
        ),
      ),
    );
  }
}