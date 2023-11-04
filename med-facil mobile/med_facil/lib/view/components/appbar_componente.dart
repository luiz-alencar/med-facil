import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Med-Fácil", style: TextStyle(color: Colors.white)),
          ), //Utilizamos o TextStyle para alterar o texto
          backgroundColor: const Color.fromRGBO(48, 77, 99, 1),
          elevation: 0,
          leading: Image.asset('assets/images/logo2.png'),

          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                icon: const Icon(Icons.logout, color: Colors.white))
          ], //Podemos utilizar a ação onPressed para chamar uma função
        )
      );
  }
  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}