import 'dart:convert';

import 'package:api_consumer/api_users.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ApiUsers> _api;

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
      _api = map;
      print(_api.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("HomeScreen"),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _api.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(10),
              height: 80,
              color: Colors.blue,
              child: Text(_api[index].phone),
            );
          },
        ),
      ),
    );
  }
}
