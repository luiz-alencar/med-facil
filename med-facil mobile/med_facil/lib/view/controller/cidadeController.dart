import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class CidadeController {
  Future<List> getCidades() async {
    QueryBuilder<ParseObject> queryCity =
        QueryBuilder<ParseObject>(ParseObject('Cidade'));

    final ParseResponse apiResponse = await queryCity.query();
    if (apiResponse.success && apiResponse.results != null) {
      //Transformar em list ou Map
      List lista = apiResponse.results as List<ParseObject>;
      return lista;
    } else {
      return [];
    }
  }
}
