import 'package:flutter/material.dart';
import 'package:med_facil/view/pages/editar_perfil.dart';
import 'package:med_facil/view/pages/login.dart';
import 'package:med_facil/view/pages/minhas_requisicoes.dart';
import 'package:med_facil/view/pages/medicamentos_disponiveis.dart';
import 'package:med_facil/view/pages/relatorio_socioeconomico.dart';
import 'package:med_facil/view/pages/requisicao_medicamentos.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

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
          title: const Center(
              child: Text('Med-Fácil',
                  style: TextStyle(
                      color: Colors
                          .white))), //Utilizamos o TextStyle para alterar o texto
          backgroundColor: const Color.fromRGBO(48, 77, 99, 1),
          elevation: 0,
          leading: SizedBox(
            child: Image.asset('assets/images/logo2.png'),
          ),
          actions: [
            IconButton(
                onPressed: () => sair(),
                icon: const Icon(Icons.logout, color: Colors.white))
          ], //Podemos utilizar a ação onPressed para chamar uma função
        ),
        body: Center(
            child: Column(children: [
          Container(
              width: 338,
              height: 650,
              child: Stack(children: [
                Positioned(
                    left: 89,
                    top: 450,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Editarperfil()),
                          );
                        },
                        child: Container(
                            width: 159,
                            height: 180,
                            child: Stack(children: [
                              Positioned(
                                  left: 0,
                                  top: 14.22,
                                  child: Container(
                                      width: 159,
                                      height: 145.78,
                                      decoration: ShapeDecoration(
                                          color: Color(0xFF304D63),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8))))),
                              Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                      width: 159,
                                      height: 152.89,
                                      decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  width: 1,
                                                  color: Color(0xFF304D63)),
                                              borderRadius:
                                                  BorderRadius.circular(8))))),
                              const Positioned(
                                  left: 48,
                                  top: 87,
                                  child: Text('Editar \nPeril',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xFF304D63),
                                          fontSize: 20,
                                          fontFamily: 'Quicksand',
                                          fontWeight: FontWeight.w700,
                                          height: 0))),
                              Positioned(
                                  left: 50,
                                  top: 21,
                                  child: Container(
                                      width: 60,
                                      height: 60,
                                      child: Stack(children: [
                                        Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                                width: 60,
                                                height: 60,
                                                child: SizedBox(
                                                    child: Image.asset(
                                                        'assets/images/imagem5.png'))))
                                      ])))
                            ])))),
                Positioned(
                    left: 179,
                    top: 100,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MedicamentosDisponiveisPage()));
                        },
                        child: Container(
                            width: 159,
                            height: 180,
                            child: Stack(children: [
                              Positioned(
                                  left: 0,
                                  top: 14.22,
                                  child: Container(
                                      width: 159,
                                      height: 145.78,
                                      decoration: ShapeDecoration(
                                          color: Color(0xFF304D63),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8))))),
                              Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                      width: 159,
                                      height: 152.89,
                                      decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 1,
                                                  color: Color(0xFF304D63)),
                                              borderRadius:
                                                  BorderRadius.circular(8))))),
                              const Positioned(
                                  left: 17,
                                  top: 87,
                                  child: Text('Medicamentos\nDisponível',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xFF304D63),
                                          fontSize: 18,
                                          fontFamily: 'Quicksand',
                                          fontWeight: FontWeight.w700,
                                          height: 0))),
                              Positioned(
                                  left: 50,
                                  top: 16,
                                  child: Container(
                                      width: 60,
                                      height: 60,
                                      child: Stack(children: [
                                        Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                                width: 60,
                                                height: 60,
                                                child: SizedBox(
                                                    child: Image.asset(
                                                        'assets/images/imagem2.png'))))
                                      ])))
                            ])))),
                Positioned(
                    left: 0,
                    top: 100,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RequisicaoMedicamentoPage()));
                        },
                        child: Container(
                            width: 159,
                            height: 160,
                            child: Stack(children: [
                              Positioned(
                                  left: 0,
                                  top: 14.22,
                                  child: Container(
                                      width: 159,
                                      height: 145.78,
                                      decoration: ShapeDecoration(
                                          color: Color(0xFF304D63),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8))))),
                              Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                      width: 159,
                                      height: 152.89,
                                      decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 1,
                                                  color: Color(0xFF304D63)),
                                              borderRadius:
                                                  BorderRadius.circular(8))))),
                              Positioned(
                                  left: 16,
                                  top: 84,
                                  child: Text('Requisição de \nMedicamentos',
                                      style: TextStyle(
                                          color: Color(0xFF304D63),
                                          fontSize: 18,
                                          fontFamily: 'Quicksand',
                                          fontWeight: FontWeight.w700,
                                          height: 0))),
                              Positioned(
                                  left: 50,
                                  top: 16,
                                  child: Container(
                                      width: 60,
                                      height: 60,
                                      child: Stack(children: [
                                        Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                                width: 60,
                                                height: 60,
                                                child: SizedBox(
                                                    child: Image.asset(
                                                        'assets/images/imagem1.png'))))
                                      ])))
                            ])))),
                Positioned(
                    left: 0,
                    top: 275,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const MinhasRequisicoesPage()),
                          );
                        },
                        child: Container(
                            width: 159,
                            height: 160,
                            child: Stack(children: [
                              Positioned(
                                left: 0,
                                top: 14.22,
                                child: Container(
                                  width: 159,
                                  height: 145.78,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF304D63),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                ),
                              ),
                              Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                      width: 159,
                                      height: 152.89,
                                      decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 1,
                                                  color: Color(0xFF304D63)),
                                              borderRadius:
                                                  BorderRadius.circular(8))))),
                              Positioned(
                                left: 28,
                                top: 87,
                                child: Text(
                                  'Minhas \nRequisições',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF304D63),
                                    fontSize: 18,
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                  left: 50,
                                  top: 16,
                                  child: Container(
                                      width: 60,
                                      height: 60,
                                      child: SizedBox(
                                          child: Image.asset(
                                              'assets/images/imagem3.png'))))
                            ])))),
                Positioned(
                    left: 179,
                    top: 275,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RelatorioSocioeconomicoPage()),
                          );
                        },
                        child: Container(
                            width: 159,
                            height: 160,
                            child: Stack(children: [
                              Positioned(
                                  left: 0,
                                  top: 14.22,
                                  child: Container(
                                      width: 159,
                                      height: 145.78,
                                      decoration: ShapeDecoration(
                                          color: Color(0xFF304D63),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8))))),
                              Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                      width: 159,
                                      height: 152.89,
                                      decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 1,
                                                  color: Color(0xFF304D63)),
                                              borderRadius:
                                                  BorderRadius.circular(8))))),
                              Positioned(
                                  left: 8,
                                  top: 87,
                                  child: Text('Relatório\nSocioeconômico',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xFF304D63),
                                          fontSize: 18,
                                          fontFamily: 'Quicksand',
                                          fontWeight: FontWeight.w700,
                                          height: 0))),
                              Positioned(
                                  left: 50,
                                  top: 18,
                                  child: Container(
                                      width: 60,
                                      height: 60,
                                      child: Stack(children: [
                                        Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                                width: 60,
                                                height: 60,
                                                child: SizedBox(
                                                    child: Image.asset(
                                                        'assets/images/imagem4.png'))))
                                      ])))
                            ]))))
              ]))
        ])));
  }

  void showSuccess(String message, TextStyle textStyle) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text(""),
              content: Text(message),
              actions: <Widget>[
                TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    })
              ]);
        });
  }

  void showError(String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text(""),
              content: Text(errorMessage),
              actions: <Widget>[
                TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  void sair() async {
    final user = await ParseUser.currentUser() as ParseUser;

    var response = await user.logout();

    if (response.success) {
      showSuccess("Espero que tenha gostado da experiência!",
          const TextStyle(fontSize: 20));
    } else {
      showError("Algo deu errado, tente novamente!");
    }
  }
}
