import 'package:flutter/material.dart';
import 'package:med_facil/view/controller/menuController.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return
        //page
        menuController();
  }
}
