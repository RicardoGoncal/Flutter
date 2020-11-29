import 'dart:convert';
import 'package:flutter/material.dart';
import 'user.dart';
import 'api.dart';
import 'package:app_listview_json/routes/routes.dart';
import 'package:app_listview_json/pages/entrada.dart';
import 'package:app_listview_json/pages/lista.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Http-Json-ListView',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      routes: {
        AppRoutes.ENTRADA: (_) => LoginPage(),
        AppRoutes.LISTA: (_) => BuildListView(),
      },
    );
  }
}
