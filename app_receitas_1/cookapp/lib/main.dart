import 'package:cookapp/pages/cadastropage.dart';
import 'package:cookapp/pages/formreceitas.dart';
import 'package:cookapp/pages/loginpage.dart';
import 'package:cookapp/pages/receitaspage.dart';
import 'package:cookapp/provider/provider.dart';
import 'package:cookapp/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Receitas Curujito',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //home: LoginPage(),
        routes: {
          AppRoutes.LOGIN: (_) => LoginPage(),
          AppRoutes.CADASTRO: (_) => CadastroPage(),
          AppRoutes.PAGE_RECEITAS: (_) => ReceitasPage(),
          AppRoutes.RECEITA_FORM: (_) => FormReceitaPage(),
        }, // Page of Login
      ),
    );
  }
}
