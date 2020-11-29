import 'package:app_receitas/pages/cadastropage.dart';
import 'package:app_receitas/pages/formreceitas.dart';
import 'package:app_receitas/pages/loginpage.dart';
import 'package:app_receitas/pages/receitaspage.dart';
import 'package:app_receitas/provider/provider.dart';
import 'package:app_receitas/routes/app_routes.dart';
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
