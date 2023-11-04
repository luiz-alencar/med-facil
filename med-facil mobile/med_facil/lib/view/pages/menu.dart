import 'package:flutter/material.dart';
import 'package:med_facil/view/components/appbar_componente.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 338,
              height: 650,
              child: Stack(
                children: [
                  Positioned(
                    left: 89,
                    top: 450,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/editarperfil');
                      },
                      child: Container(
                        width: 159,
                        height: 180,
                        child: Stack(
                          children: [
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
                                        width: 1, color: Color(0xFF304D63)),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 48,
                              top: 87,
                              child: Text(
                                'Editar \nPeril',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF304D63),
                                  fontSize: 20,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 50,
                              top: 21,
                              child: Container(
                                width: 60,
                                height: 60,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        child: SizedBox(
                                          child: Image.asset(
                                              'assets/images/imagem5.png'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 179,
                    top: 100,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/medicamentosdisponiveis');
                      },
                      child: Container(
                        width: 159,
                        height: 180,
                        child: Stack(
                          children: [
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
                                        width: 1, color: Color(0xFF304D63)),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 17,
                              top: 87,
                              child: Text(
                                'Medicamentos\nDisponível',
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
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        child: SizedBox(
                                          child: Image.asset(
                                              'assets/images/imagem2.png'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 100,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/requisicao');
                      },
                      child: Container(
                        width: 159,
                        height: 160,
                        child: Stack(
                          children: [
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
                                        width: 1, color: Color(0xFF304D63)),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 16,
                              top: 84,
                              child: Text(
                                'Requisição de \nMedicamentos',
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
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        child: SizedBox(
                                          child: Image.asset(
                                              'assets/images/imagem1.png'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 275,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/minhasrequisicoes');
                      },
                      child: Container(
                        width: 159,
                        height: 160,
                        child: Stack(
                          children: [
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
                                        width: 1, color: Color(0xFF304D63)),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
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
                                  child:
                                      Image.asset('assets/images/imagem3.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 179,
                    top: 275,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/relatorio');
                      },
                      child: Container(
                        width: 159,
                        height: 160,
                        child: Stack(
                          children: [
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
                                        width: 1, color: Color(0xFF304D63)),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 8,
                              top: 87,
                              child: Text(
                                'Relatório\nSocioeconômico',
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
                              top: 18,
                              child: Container(
                                width: 60,
                                height: 60,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        child: SizedBox(
                                          child: Image.asset(
                                              'assets/images/imagem4.png'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
