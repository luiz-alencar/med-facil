import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const keyApplicationId = 'WjQu4nNtnIhX0a28N7hEutXWSsktUUJGxCgP3Dhl';
  const keyClientKey = 'oXYtaLVlfM7l3MQwlKerl5a4DQa3Y5F4ccZLbG2O';
  const keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);
  runApp(MyApp());
}

class Cidade extends ParseObject implements ParseCloneable {
  Cidade() : super(_keyTableName);

  Cidade.clone() : this();

  static const String _keyTableName = 'Cidade';

  String get nomeCidade => get<String>('nomeCidade')!;

  set nomeCidade(String value) => set<String>('nomeCidade', value);

  @override
  Cidade clone(Map<String, dynamic> map) => Cidade.clone()..fromJson(map);

  @override
  Cidade fromJson(Map<String, dynamic> objectData) {
    super.fromJson(objectData);
    return this;
  }
}

class CidadeService {
  static Future<List<Cidade>> getCidades() async {
    final queryBuilder = QueryBuilder<Cidade>(Cidade())
      ..orderByAscending('nomeCidade');

    final response = await queryBuilder.query();

    if (response.success && response.results != null) {
      final List parseObjects = response.results!;
      final List<Cidade> cidades = parseObjects
          .map((parseObject) => Cidade().fromJson(parseObject.toJson()))
          .toList();

      return cidades;
    } else {
      throw Exception('Failed to load cities');
    }
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Cidade>> _cidades;
  String? _selectedCity;

  @override
  void initState() {
    super.initState();
    _cidades = CidadeService.getCidades();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cidade Dropdown'),
      ),
      body: Center(
        child: FutureBuilder<List<Cidade>>(
          future: _cidades,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    value: _selectedCity,
                    hint: Text('Select a city'),
                    onChanged: (String? value) {
                      setState(() {
                        _selectedCity = value;
                      });
                    },
                    items: snapshot.data!
                        .map((cidade) => DropdownMenuItem<String>(
                              value: cidade.nomeCidade,
                              child: Text(cidade.nomeCidade),
                            ))
                        .toList(),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Selected City: ${_selectedCity ?? "None"}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
