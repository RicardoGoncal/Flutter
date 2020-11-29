import 'package:flutter/material.dart';

class Places {
  final String idReceita;
  final String nomeReceita;
  final String imagemReceita;
  final double lat;
  final double long;

  const Places({
    this.idReceita,
    @required this.nomeReceita,
    @required this.imagemReceita,
    @required this.lat,
    @required this.long,
  });
}
