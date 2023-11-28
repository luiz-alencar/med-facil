import 'package:flutter/material.dart';
import 'package:med_facil/view/controller/medicamentosController.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class MedicamentosListView extends StatefulWidget {
  const MedicamentosListView({super.key});

  @override
  State<MedicamentosListView> createState() => _MedicamentosListViewState();
}

class _MedicamentosListViewState extends State<MedicamentosListView> {
  late Future<List<ParseObject>?> fetch;
  final TextEditingController _searchController = TextEditingController();
  List<ParseObject> filteredMedicamento = [];

  @override
  void initState() {
    super.initState();
    fetch = buscar();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ParseObject>?>(
      future: fetch,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const Center(
              child: SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  color: Color(0xFF304D63),
                ),
              ),
            );
          default:
            if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            }

            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return const Center(
                child: Text("No Data..."),
              );
            }

            var medicamentos = snapshot.data;

            return Column(
              children: [
                SizedBox(
                  width: 328,
                  height: 84,
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Pesquisar',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    onChanged: (text) {
                      // Utilize debounce para evitar chamadas desnecessárias durante a digitação rápida
                      // Implemente a função debounce ou utilize um pacote para isso
                      // Exemplo: https://pub.dev/packages/debouncer
                      // debounce(() {
                      setState(() {
                        filteredMedicamento = medicamentos!
                            .where((medicamento) =>
                                medicamento.get('nomeCompleto')
                                    .toLowerCase()
                                    .contains(text.toLowerCase()))
                            .toList();
                      });
                      // }, duration: Duration(milliseconds: 500));
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 5.0),
                    itemCount: filteredMedicamento.isNotEmpty
                        ? filteredMedicamento.length
                        : medicamentos!.length,
                    itemBuilder: (context, index) {
                      final medicamento = filteredMedicamento.isNotEmpty
                          ? filteredMedicamento[index]
                          : medicamentos![index];
                      final varTitle =
                          medicamento.get<String>('nomeCompleto') ?? '';
                      return ListTile(
                        title: Text(varTitle),
                      );
                    },
                  ),
                ),
              ],
            );
        }
      },
    );
  }
}
