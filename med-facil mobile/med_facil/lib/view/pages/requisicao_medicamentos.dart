import 'package:flutter/material.dart';
import 'package:non_uniform_border/non_uniform_border.dart';
import 'package:med_facil/view/pages/login.dart';
import 'package:med_facil/view/pages/menu.dart';

class RequisicaoMedicamentoPage extends StatefulWidget {
  const RequisicaoMedicamentoPage({super.key});

  @override
  State<RequisicaoMedicamentoPage> createState() => _RequisicaoMedicamentoState();
}

class _RequisicaoMedicamentoState extends State<RequisicaoMedicamentoPage> {
  List lista = ["Ceres", "Itapaci", "Rialma"];
  final shapeBorder = NonUniformBorder(
    leftWidth: 1,
    rightWidth: 1,
    topWidth: 1,
    bottomWidth: 4,
    color: Color.fromRGBO(48, 77, 99, 100),
    strokeAlign: BorderSide.strokeAlignCenter,
    borderRadius: BorderRadius.circular(12)
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Med-Fácil", style: TextStyle(color: Colors.white)), //Utilizamos o TextStyle para alterar o texto
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
      body: Center(
        child: Column(
          children: [
            Text(
              'Requisição de Medicamentos',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF304D63),
                fontSize: 24,
                fontFamily: 'Palanquin Dark',
                fontWeight: FontWeight.w700,
                height: 2.5,
              ),
            ),
            Container(
              width: 318,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignCenter,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 328,
              height: 84,
              child: Text(
                'Olá, aqui você deverá gerar suas requisições, apresente nos campos abaixo informações sobre sua requisição de medicamentos e informe suas necessidades!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 16,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 320,
              height: 29,
              child: Text(
                'Medicamento:',
                style: TextStyle( 
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            Container(
                width: 328,
                decoration: ShapeDecoration(
                  shape: shapeBorder,
                ),
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                  onChanged: (newValue){
                    setState(() {
                      
                    });
                  },
                  items: lista.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem));
                  }).toList(),
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: 320,
                height: 29,
                child: Text(
                  'Quantidade:',
                  style: TextStyle( 
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              Container(
                  width: 328,
                  decoration: ShapeDecoration(
                    shape: shapeBorder,
                  ),
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                    onChanged: (newValue){
                      setState(() {
                        
                      });
                    },
                    items: lista.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem));
                    }).toList(),
                  ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: 320,
                height: 29,
                child: Text(
                  'Uso:',
                  style: TextStyle( 
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              SizedBox(
                  width: 328,
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                    onChanged: (newValue){
                      setState(() {
                        
                      });
                    },
                    items: lista.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem));
                    }).toList(),
                  ),
              ), 
              const SizedBox(height: 50),
              SizedBox(
                  height: 44,
                  width: 344,
                  child: ElevatedButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MenuPage()),
                  );
                }, child: const Text("Enviar", style: TextStyle(fontSize: 20))
                )),
          ],
        )
      ),
    );
  }
}