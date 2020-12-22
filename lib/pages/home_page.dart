import 'dart:convert';

import 'package:api_consumer/widgets/user_card.dart';
import 'package:api_consumer/models/api_users.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ApiUsers> _api;
  bool carregado = false;

  Future<List<ApiUsers>> _getUser() async {
    try {
      List<ApiUsers> listUser = List();
      final response =
          await http.get('https://jsonplaceholder.typicode.com/users');
      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(response.body);
        decodeJson.forEach((item) => listUser.add(ApiUsers.fromJson(item)));
        return listUser;
      } else {
        print("Erro ao carregar lista");
        return null;
      }
    } catch (e) {
      print("Erro ao carregar lista");
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _getUser().then((map) {
      setState(() {
        _api = map;
        carregado = true;
      });
      // print(_api.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("HomeScreen"),
      ),
      body: carregado
          ? UserCard(_api)
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

// CONTINUAR A PARTIR DAQUI
// https://www.youtube.com/watch?v=ugw3s8plVDk&list=PLlBnICoI-g-d-J57QIz6Tx5xtUDGQdBFB&index=47
