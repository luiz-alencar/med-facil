import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

Future<List<ParseObject>> buscarPedido() async {
  final DateTime now = DateTime.now();
  final DateTime primeiroDiaDoMesAtual = DateTime(now.year, now.month, 1);
  final DateTime primeiroDiaDoProximoMes = DateTime(now.year, now.month + 1, 1);

  QueryBuilder<ParseObject> query =
      QueryBuilder<ParseObject>(ParseObject('Pedido'))
      ..whereGreaterThanOrEqualsTo('createdAt', primeiroDiaDoMesAtual)
      ..whereLessThan('createdAt', primeiroDiaDoProximoMes);
  try {
    final response = await query.query();
    if (response.success && response.results != null) {
      return response.results as List<ParseObject>;
    } else {
      print('Erro ao buscar dados: ${response.error!.message}');
      return [];
    }
  } catch (e) {
    print('Erro ao buscar dados: $e');
    return [];
  }
}
