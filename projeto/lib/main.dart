import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projeto/homepage.dart';
import 'entrada.dart';
import 'routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // Esse é o widget root da apliacação

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projeto Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff337b52),
      ),
      //home: LoginPage(),
      routes: {
        Routes.ENTRADA: (_) => LoginPage(),
        Routes.HOMEPAGE: (_) => HomePage(),
      }, // Page of Login
    );
  }
}
