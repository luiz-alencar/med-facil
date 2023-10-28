import 'package:flutter/material.dart';
import 'package:med_facil/teste3.dart';

class MedicamentosListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: medicamentos.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(medicamentos[index].nome),
          subtitle: Text('Dosagem: ${medicamentos[index].dosagem}'),
        );
      },
    );
  }
}
