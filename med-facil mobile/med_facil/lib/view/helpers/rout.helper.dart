import 'package:flutter/material.dart';

void goToLogin(context) {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  });
}

void goToCadastro(context) {
  Navigator.pushNamed(context, '/cadastrar');
}

void goToEditar(context) {
  Navigator.pushNamed(context, '/editarperfil');
}

void goToMenu(context) {
  Navigator.pushNamed(context, '/menu');
}

void goToMenuAdmin(context) {
  Navigator.pushNamed(context, '/menuadmin');
}

void goToRelatorio(context) {
  Navigator.pushNamed(context, '/relatorio');
}

void goToRequisicao(context) {
  Navigator.pushNamed(context, '/requisicao');
}

void goToRequisicoes(context) {
  Navigator.pushNamed(context, '/minhasrequisicoes');
}

void goToMedicamentos(context) {
  Navigator.pushNamed(context, '/medicamentosdisponiveis');
}

void goToExibir(context) {
  Navigator.pushNamed(context, '/exibirrelatorio');
}
