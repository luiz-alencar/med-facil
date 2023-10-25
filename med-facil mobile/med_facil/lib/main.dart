import 'package:flutter/material.dart';
import 'package:med_facil/view/pages/login.dart';
import 'package:med_facil/view/pages/menu_admin.dart';
import 'package:med_facil/view/pages/requisicao_medicamentos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tela Login',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MenuAdminPage(),
    );
  }
}
