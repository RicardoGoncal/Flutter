import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:app_listview_json/user.dart';
import 'package:app_listview_json/api.dart';

class BuildListView extends StatefulWidget {
  @override
  createState() => _BuildListViewState();
}

class _BuildListViewState extends State {
  var users = new List<User>();
  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de Corredores"),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(users[index].corredor));
          },
        ));
  }
}
