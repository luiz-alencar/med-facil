// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_const_constructors_in_immutables

import 'dart:html';

import 'package:flutter/material.dart';

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
      Podemos utilizar o design Cuppertino, para ficar basedo no iOS
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
  title: Text("Med-Fácil. Remédios na medida certa!", style: TextStyle(color: Colors.black)), //Utilizamos o TextStyle para alterar o texto
  backgroundColor: const Color.fromARGB(255, 62, 197, 132),
  elevation: 0,
  actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout, color: Colors.black))],  //Podemos utilizar a ação onPressed para chamar uma função
),

drawer: Drawer(
  backgroundColor: const Color.fromARGB(255, 62, 197, 132),
  /* -----
    Para implementar os ícones em um Drawer, temos que utilizar uma ancoragem maior
    No caso abaixo utilizamos Column, que será explicada na próxima seção
  ----- */
  child: Column(children: [
    DrawerHeader(child: Icon(Icons.favorite)),
    ListTile( //Utilizamos o ListTitle para podemos criar os títula e espaço de navegação
      leading: Icon(
        Icons.home,
        color: Colors.black,
      ),
      title: Text("Home", style: TextStyle(color: Colors.black)),
    ),
    ListTile(
      leading: Icon(
        Icons.person,
        color: Colors.black,
      ),
      title: Text("Perfil", style: TextStyle(color: Colors.black)),
    ),
    ListTile(
      leading: Icon(
        Icons.settings,
        color: Colors.black,
      ),
      title:
          Text("Configurações", style: TextStyle(color: Colors.black)),
    )
  ]),
),

bottomNavigationBar: BottomNavigationBar(
    backgroundColor: const Color.fromARGB(255, 62, 197, 132),
    unselectedItemColor: Colors.black, //Podemos utilizar para mudar o estilo dos itens não selecionados
    selectedItemColor: Colors.black, //Podemos utilizar para mudar o estilo dos itens selecionados
    items: [
      //Home
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: Colors.black,
        ),
        label: 'Home',
      ),
      //Perfil
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
          color: Colors.black,
        ),
        label: 'Perfil',
      ),
      //Configurações
      BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
          color: Colors.black,
        ),
        label: 'Configurações',
      ),
    ]),

body: Center(

    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Login",
              filled: true,
              fillColor: Colors.white),
        ),
                TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Senha",
              filled: true,
              fillColor: Colors.white),
        ),
        ElevatedButton(onPressed: () {}, child: Text("Entrar")),
      ]),
    ),
)
        /* ----------------------------------------------------------------------
              !!                  FIM DA IMPLEMENTAÇÃO                     !!                      
        ---------------------------------------------------------------------- */
      ),
    );
  }
}