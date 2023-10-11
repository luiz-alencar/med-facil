import 'package:flutter/material.dart';
import 'package:med_facil/widgests/login.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Med-Fácil. Remédios na medida certa!", style: TextStyle(color: Colors.white)), //Utilizamos o TextStyle para alterar o texto
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
    );
  }
}