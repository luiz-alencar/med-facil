// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_const_constructors_in_immutables


import 'package:flutter/material.dart';
import 'package:med_facil/widgests/login.dart';

/* ----- 
  Função principal do Flutter, assim que inicarmos a depuração, será a primeira função a ser chamada.
----- */
void main() {
  /* ----- 
    runApp é a função do flutter para inicarmos um widget, este widget será carregado sempre que for chamado
  ----- */
  
  runApp(MainApp());
}
/* ----- 
  Implementamos a função que é chamada na main, assim que o aplcicativo iniciar, essa função será chamada 
----- */
class MainApp extends StatelessWidget {
  MainApp({super.key});
  
  /* ----- 
    Para a primeira função, criamos um StatelessWidget, que será a base do nosso aplicativo
  ----- */
  @override
  Widget build(BuildContext context) {
    /* ----- 
      Aqui, trocamos a inicialização do nosso widget para MaterialApp, para ter o design parecido com o Android
      Podemos utilizar o design Cuppertino, para ficar baseado no iOS
      Durante as aulas, utilizaremos o modelo MaetrialApp
      Para os exemplos, removemos também a opção const
    ----- */
    return MaterialApp(
      /* ----- 
        Podemos utilizar essa configuração para remover a barra de debug da tela incial
      ----- */
      debugShowCheckedModeBanner: false,
      /* -----
        Agora, iremos iniciar nossa estrutura das páginas, para isso iniciamos primeiramente a estrutura Scaffold
        Ela servirá como um esqueleto para montarmos nosso aplicativo
        A estrutura Scaffold é inicada na tag home:, a parte inicial do aplicativo
        Dentro da Scaffold, podemos inicar outras tags, como:
          body, appBar, navBar, bottomNavigationBar, Colum, Widget dentre outrast
      ----- */
      home: Scaffold(
        /* -----
          Podemos colocar uma cor de background para a nossa estrutura, essa cor será a base de todo o aplicativo carregado nesta página
        ----- */
        backgroundColor: Colors.white,
        /* ----------------------------------------------------------------------
              !! TODOS OS CÓDIGOS ABAIXO, SERÃO IMPLEMENTADOS NESTE ESPAÇO !! 
        ---------------------------------------------------------------------- */
        /* -----
  Utilizamos a tag appBar, para construir
----- */

  appBar: AppBar(
  title: Text("Med-Fácil. Remédios na medida certa!", style: TextStyle(color: Colors.white)), //Utilizamos o TextStyle para alterar o texto
  backgroundColor: Color.fromRGBO(48, 77, 99, 1),
  elevation: 0,
  actions: [IconButton(onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }, icon: Icon(Icons.house, color: Colors.white))],  //Podemos utilizar a ação onPressed para chamar uma função
),

drawer: Drawer(
  backgroundColor: const Color.fromRGBO(48, 77, 99, 1),
  
  /* -----
    Para implementar os ícones em um Drawer, temos que utilizar uma ancoragem maior
    No caso abaixo utilizamos Column, que será explicada na próxima seção
  ----- */
  child: Column(children: [
    DrawerHeader(child: Icon(Icons.favorite, color: Colors.white,)),
    ListTile( //Utilizamos o ListTitle para podemos criar os títula e espaço de navegação
      leading: Icon(
        Icons.home,
        color: Colors.white,
      ),
      title: Text("Home", style: TextStyle(color: Colors.white)),
    ),
    ListTile(
      leading: Icon(
        Icons.person,
        color: Colors.white,
      ),
      title: Text("Perfil", style: TextStyle(color: Colors.white)),
    ),
    ListTile(
      leading: Icon(
        Icons.settings,
        color: Colors.white,
      ),
      title:
          Text("Configurações", style: TextStyle(color: Colors.white)),
    )
  ]),
),


      ),
    );
  }
}

