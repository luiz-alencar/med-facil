import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Cidade extends ParseObject implements ParseCloneable {
  Cidade() : super('Cidade');

  @override
  clone(Map<String, dynamic> map) => Cidade.clone()..fromJson(map);

  Cidade.clone() : this();

  static const String keyNome = 'nomeCidade';

  factory Cidade.fromParseObject(ParseObject? object) {
    return Cidade()
      ..objectId = object?.objectId
      ..nome = object?[keyNome];
  }

  String? get nome => get<String>(keyNome);
  set nome(String? nome) => set<String?>(keyNome, nome);
}
