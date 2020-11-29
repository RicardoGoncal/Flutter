import 'package:flutter/material.dart';

class Receita {
  final String idReceita;
  final String nomeReceita;
  final String imagemReceita;

  const Receita({
    this.idReceita,
    @required this.nomeReceita,
    @required this.imagemReceita,
  });
}
