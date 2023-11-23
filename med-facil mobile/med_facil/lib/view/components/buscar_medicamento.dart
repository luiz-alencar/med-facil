import 'package:flutter/material.dart';
import 'package:med_facil/view/controller/medicamentosController.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class MedicamentosListView extends StatelessWidget {
  const MedicamentosListView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ParseObject>>(
      future: buscar(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: Container(
                  width: 100,
                  height: 100,
                  child: const CircularProgressIndicator()),
            );
          default:
            if (snapshot.hasError) {}
            if (!snapshot.hasData) {
              return const Center(
                child: Text("No Data..."),
              );
            } else {
              return ListView.builder(
                padding: EdgeInsets.only(top: 5.0),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final varTodo = snapshot.data![index];
                  final varTitle = varTodo.get<String>('nomeCompleto')!;
                  return Material(
                    child: ListTile(
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter)),
                      title: Text(varTitle),
                    ),
                  );
                },
              );
            }
        }
      },
    );
  }
}
