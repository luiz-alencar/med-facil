import 'package:flutter/material.dart';
import 'package:med_facil/view/pages/cadastro_usuario.dart';
import 'package:med_facil/view/pages/editar_perfil.dart';
import 'package:med_facil/view/pages/exibir_relatorio.dart';
import 'package:med_facil/view/pages/login.dart';
import 'package:med_facil/view/pages/medicamentos_disponiveis.dart';
import 'package:med_facil/view/pages/menu.dart';
import 'package:med_facil/view/pages/menu_admin.dart';
import 'package:med_facil/view/pages/minhas_requisicoes.dart';
import 'package:med_facil/view/pages/relatorio_socioeconomico.dart';
import 'package:med_facil/view/pages/requisicao_medicamentos.dart';
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
        '/exibirrelatorio':(context) => exibirRelatorioPage()
      },
    );
  }
}