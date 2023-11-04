import 'package:flutter/material.dart';
import 'package:med_facil/view/pages/cadastro_usuario.dart';
import 'package:med_facil/view/pages/editar_perfil.dart';
import 'package:med_facil/view/pages/login.dart';
import 'package:med_facil/view/pages/medicamentos_disponiveis.dart';
import 'package:med_facil/view/pages/menu.dart';
import 'package:med_facil/view/pages/menu_admin.dart';
import 'package:med_facil/view/pages/minhas_requisicoes.dart';
import 'package:med_facil/view/pages/relatorio_socioeconomico.dart';
import 'package:med_facil/view/pages/requisicao_medicamentos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tela Login',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/cadastrar': (context) => CadastroUsuarioPage(),
        '/editarperfil': (context) => Editarperfil(),
        '/menu': (context) => const MenuPage(),
        '/relatorio': (context) => RelatorioSocioeconomicoPage(),
        '/requisicao': (context) => RequisicaoMedicamentoPage(),
        '/minhasrequisicoes': (context) => MinhasRequisicoesPage(),
        '/menuadmin': (context) => const MenuAdminPage(),
        '/medicamentosdisponiveis': (context) => const MedicamentosDisponiveisPage(),
      },
    );
  }
}
