import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  ParseUser? user;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  fetchUser() async {
    var user = await ParseUser.currentUser();
    var queryBuilder = QueryBuilder<ParseUser>(ParseUser.forQuery())
      ..whereEqualTo('objectId', user.objectId);

    var response = await queryBuilder.query();
    log(user.username);
    if (user != null) {
      
      if (response.success && response.results != null) {
        var userResponse = response.results?.first;
        // Aqui você pode acessar os dados do usuário
        // Ex: var username = userResponse.username;
        log(userResponse.username);
        

                // Adicione mais Text Widgets para exibir mais informações do usuári;
      } else {
        log(response.error!.message);
      }
    } else {
      log('Nenhum usuário logado');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Username: ${user?.username}'),
                Text('Email: ${user?.emailAddress}'),
              ],
            );
  }
}