// Criação da tela para adicionar um objeto receita a ser consultado

import 'package:app_receitas/models/users.dart';
import 'package:app_receitas/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormReceitaPage extends StatefulWidget {
  @override
  _FormReceitaPageState createState() => _FormReceitaPageState();
}

class _FormReceitaPageState extends State<FormReceitaPage> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(Receita receita) {
    if (receita != null) {
      _formData['idReceita'] = receita.idReceita;
      _formData['nomeReceita'] = receita.nomeReceita;
      _formData['imagemReceita'] = receita.imagemReceita;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Receita receita = ModalRoute.of(context).settings.arguments;

    _loadFormData(receita);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 40, left: 40, right: 40),
        color: Colors.white,
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              Text(
                "Informações da Receita",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.deepOrange,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Por favor, informe o nome da receita a ser adicionada, e se desejavel uma imagem.",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: _formData['nomeReceita'],
                autofocus: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Digite o nome da receita",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Digite o nome da receita.';
                  }

                  return null;
                },
                onSaved: (value) => _formData['nomeReceita'] = value,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: _formData['imagemReceita'],
                autofocus: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Cole a URL da imagem escolhida.",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                onSaved: (value) => _formData['imagemReceita'] = value,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 30,
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
                      Color(0XFFFAD0F1E),
                      Color(0XFFFFFCB01),
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
                          'Salvar receita',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Container(
                          child: SizedBox(
                            child: Image.asset("assets/choco.png"),
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      final isValid = _form.currentState.validate();

                      if (isValid) {
                        _form.currentState.save();
                        Provider.of<UserProvider>(context, listen: false).put(
                          Receita(
                            idReceita: _formData['idReceita'],
                            nomeReceita: _formData['nomeReceita'],
                            imagemReceita: _formData['imagemReceita'],
                          ),
                        );
                        Navigator.of(context).pop();
                      }
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
