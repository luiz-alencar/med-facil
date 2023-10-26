import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:med_facil/view/pages/login.dart';

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
    return Material(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 95,
                  height: 71,
                  child: Image.asset('assets/images/logo.png'),
                ),
              const SizedBox(height: 10),
              const Text("Edite seus dados:", style: TextStyle(fontSize: 30)),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nome Completo",
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                inputFormatters: [
                  // obrigatório
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter(),
                ],
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "CPF",
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "E-mail",
                ),
              ), 
              const SizedBox(height: 10),
              TextFormField(
                inputFormatters: [
                  // obrigatório
                  FilteringTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter(),
                ],
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Telefone",
                ),
              ), 
              const SizedBox(height: 10),
              TextFormField(
                inputFormatters: [
                  // obrigatório
                  FilteringTextInputFormatter.digitsOnly,
                  DataInputFormatter(),
                ],
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Data de Nascimento",
                ),
              ), 
              const SizedBox(height: 10),
              SizedBox(
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Cidade",
                  ),
                  hint: const Text("Selecione a Cidade "),
                  value: valueEscolhido,
                  onChanged: (newValue){
                    setState(() {
                      valueEscolhido = newValue;
                    });
                  },
                  items: lista.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem));
                  }).toList(),
                ),
              ), 
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Login",
                ),
              ), 
              const SizedBox(height: 10),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Senha",
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                  height: 44,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                }, child: const Text("Voltar", style: TextStyle(fontSize: 18)))), 
            ]),
        ), 
        ),
    );
  }
}






/*



*/