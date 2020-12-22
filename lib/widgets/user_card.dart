import 'package:api_consumer/models/api_users.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  List<ApiUsers> _api;

  UserCard(this._api);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: _api.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            height: 80,
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_api[index].name),
                  Text(_api[index].email),
                  Text(_api[index].phone),
                  Text(_api[index].company.name),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
