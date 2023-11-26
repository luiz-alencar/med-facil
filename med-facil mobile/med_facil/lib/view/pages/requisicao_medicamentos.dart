import 'package:flutter/material.dart';
import 'package:med_facil/view/controller/requisicaoController.dart';

class RequisicaoMedicamentoPage extends StatefulWidget {
  const RequisicaoMedicamentoPage({super.key});

  @override
  State<RequisicaoMedicamentoPage> createState() =>
      _RequisicaoMedicamentoState();
}

class _RequisicaoMedicamentoState extends State<RequisicaoMedicamentoPage> {
  @override
  Widget build(BuildContext context) {
    return
        //page
        requisicaoController();
  }
}
