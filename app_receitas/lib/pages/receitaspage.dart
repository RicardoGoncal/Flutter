// Pagina principal do app, onde irá conter as receitas adicinadas pelo usuario

import 'package:app_receitas/componentes/user_tile.dart';
import 'package:app_receitas/provider/provider.dart';
import 'package:app_receitas/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReceitasPage extends StatefulWidget {
  @override
  _ReceitasPageState createState() => _ReceitasPageState();
}

class _ReceitasPageState extends State<ReceitasPage> {
  @override
  Widget build(BuildContext context) {
    final UserProvider users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Receitas"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.RECEITA_FORM,
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
        itemCount: users.count,
      ),
    );
  }
}
