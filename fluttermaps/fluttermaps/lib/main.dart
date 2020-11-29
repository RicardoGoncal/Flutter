import 'package:fluttermaps/pages/entrada.dart';
import 'package:fluttermaps/pages/maps.dart';
import 'package:fluttermaps/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Travels Curujito.',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      routes: {
        AppRoutes.ENTRADA: (_) => LoginPage(),
        AppRoutes.MAPS: (_) => MyMaps(),
      },
    );
  }
}
