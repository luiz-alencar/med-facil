// ignore: file_names
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

Future<List<ParseObject>> buscar() async {
  QueryBuilder<ParseObject> queryBuscar =
      QueryBuilder<ParseObject>(ParseObject('Medicamentos'))..setLimit(1000);
  final ParseResponse apiResponse = await queryBuscar.query();

  if (apiResponse.success && apiResponse.results != null) {
    return apiResponse.results as List<ParseObject>;
  } else {
    return [];
  }
}
