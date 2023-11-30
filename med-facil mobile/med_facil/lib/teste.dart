import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class MyDropdownPage extends StatefulWidget {
  @override
  _MyDropdownPageState createState() => _MyDropdownPageState();
}

class _MyDropdownPageState extends State<MyDropdownPage> {
  List<String> _items = []; // Lista para armazenar os itens do Dropdown
  String? _selectedItem; // Item selecionado no Dropdown

  @override
  void initState() {
    super.initState();
    _fetchDataFromBack4App(); // Inicializa o carregamento dos dados do Back4App
  }

  // Função para obter dados do Back4App
  Future<void> _fetchDataFromBack4App() async {
    final query = QueryBuilder(ParseObject('Medicamentos')); // Substitua 'YourClassName' pelo nome da sua classe no Back4App

    try {
      final response = await query.query();
      if (response.success && response.results != null) {
        setState(() {
          _items = response.results!.map((obj) => obj['nomeCompleto'].toString()).toList();
        });
      } else {
        print('Error fetching data from Back4App: ${response.error}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DropdownButton with Back4App'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 1000,
            child: DropdownButton(
              value: _selectedItem,
              items: _items.map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedItem = value!;
                });
              },
              hint: Text('Select an item'),
            ),
          ),
        ),
      ),
    );
  }
}
