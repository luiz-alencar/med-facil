import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:med_facil/view/pages/menu.dart';

class EditarPerfilPage extends StatefulWidget {
  const EditarPerfilPage({super.key});

  @override
  State<EditarPerfilPage> createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfilPage> {
  Object? valueEscolhido;
  List lista = ["Ceres", "Itapaci", "Rialma"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text("Med-Fácil", style: TextStyle(color: Colors.white)),
        ), //Utilizamos o TextStyle para alterar o texto
        backgroundColor: const Color.fromRGBO(48, 77, 99, 1),
        elevation: 0,
        leading: Image.asset('assets/images/logo2.png'),

        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MenuPage()),
                );
              },
              icon: const Icon(Icons.house, color: Colors.white))
        ], //Podemos utilizar a ação onPressed para chamar uma função
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Editar Perfil ',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF304D63),
              fontSize: 24,
              fontFamily: 'Palanquin Dark',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          Container(
            width: 150,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 207,
            height: 23,
            child: Text(
              'Editar Perfil ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 344,
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                labelText: "Nome Completo",
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 344,
            child: TextFormField(
              inputFormatters: [
                // obrigatório
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter(),
              ],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                labelText: "CPF",
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 344,
            child: const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                labelText: "E-mail",
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 344,
            child: TextFormField(
              inputFormatters: [
                // obrigatório
                FilteringTextInputFormatter.digitsOnly,
                TelefoneInputFormatter(),
              ],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                labelText: "Telefone",
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 344,
            child: TextFormField(
              inputFormatters: [
                // obrigatório
                FilteringTextInputFormatter.digitsOnly,
                DataInputFormatter(),
              ],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                labelText: "Data de Nascimento",
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 344,
            child: DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                labelText: "Cidade",
              ),
              hint: const Text("Selecione a Cidade "),
              value: valueEscolhido,
              onChanged: (newValue) {
                setState(() {
                  valueEscolhido = newValue;
                });
              },
              items: lista.map((valueItem) {
                return DropdownMenuItem(
                    value: valueItem, child: Text(valueItem));
              }).toList(),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 344,
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                labelText: "Login",
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 344,
            child: const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                labelText: "Senha",
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
              width: 344,
              height: 44,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MenuPage()),
                  );
                },
                child: Text('Salvar',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
              decoration: ShapeDecoration(
                color: Color(0xFF304D63),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              )),
        ]),
      ),
    );
  }
}






/*
          


*/