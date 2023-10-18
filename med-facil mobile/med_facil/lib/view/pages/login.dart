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
                const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Login",
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Senha",
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MenuPage()),
                  );
                }, child: const Text("Entrar", style: TextStyle(fontSize: 18)))),
                const SizedBox(height: 10),
                const Text("ou", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CadastroUsuarioPage()),
                  );
                }, child: const Text("Cadastre-se", style: TextStyle(fontSize: 18)))),
              ],
            ),
        ),
      ),
    );
  }
}