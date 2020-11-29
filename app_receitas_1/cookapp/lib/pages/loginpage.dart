// Criação da pagina de Login de acesso ao aplicativo.

import 'package:cookapp/routes/app_routes.dart';
import 'package:flutter/material.dart';

// Criação da classe LoginPage
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String senha = '';

  @override
  Widget build(BuildContext context) {
    // Scaffold, estrutura de design visual.
    return Scaffold(
      // Container: corpo da estrutura onde irá contar os elementos
      body: Container(
        padding: EdgeInsets.only(
            top: 60,
            left: 40,
            right: 40), // assume os valores como margens da tela
        color: Colors.white, // Cor de fundo da estrutura
        // Conceito de child: Atribuito que pode assumir como sendo o filho do Container
        // Listview: estrutura de lista que contém elementos como, botões, forms, textos....
        child: Form(
          // Conceito de children: Atributo de Listview para poder acoplar widgets.
          child: Column(
            children: <Widget>[
              SizedBox(
                // Caixa que pode conter elementos dentro
                width: 100, // Largura
                height: 100, // Altura
                child: Image.asset(
                    "assets/logo.png"), // Filho do SizedBox que atribui uma imagem.
              ),
              SizedBox(
                // Caixa que apenas faz a separação de um widget para outro.
                height: 20, // Altura
              ),
              TextFormField(
                autofocus: true,
                onChanged: (val) {
                  setState(() => email = val);
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "E-mail",
                    labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    )),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                autofocus: true,
                onChanged: (val) {
                  setState(() => senha = val);
                },
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    )),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [
                      Color(0XFFFAD0F1E),
                      Color(0XFFFFFCB01),
                      //Color(0xFFF58524),
                      //Color(0XFFF92B7F),
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: SizedBox.expand(
                  child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Container(
                          child: SizedBox(
                            child: Image.asset("assets/lasanha.png"),
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () => {
                      print(email),
                      print(senha),
                      Navigator.of(context).pushNamed(
                        AppRoutes.PAGE_RECEITAS,
                      )
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                alignment: Alignment.center,
                child: FlatButton(
                  child: Text(
                    "Cadastre-se",
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.CADASTRO,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
