import 'package:fluttermaps/routes/routes.dart';
import 'package:flutter/material.dart';

// Criação da classe LoginPage
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // Scaffold, estrutura de design visual.
    return Scaffold(
      // Container: corpo da estrutura onde irá contar os elementos
      body: Container(
        padding: EdgeInsets.only(
            top: 150,
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
                width: 200, // Largura
                height: 200, // Altura
                child: Image.asset(
                    "assets/terra2.png"), // Filho do SizedBox que atribui uma imagem.
              ),
              SizedBox(
                // Caixa que apenas faz a separação de um widget para outro.
                height: 20, // Altura
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [
                      Color(0XFF5B5EA3),
                      Color(0XFFB3D096),
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
                          'Entrar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    onPressed: () => {
                      print('Entrou'),
                      Navigator.of(context).pushNamed(
                        AppRoutes.MAPS,
                      )
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
