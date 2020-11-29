import 'dart:math';

import 'package:app_receitas/data/dummy.dart';
import 'package:app_receitas/models/users.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  final Map<String, Receita> _items = {...DUMMY};

  List<Receita> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Receita byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Receita receita) {
    if (receita == null) {
      return;
    }

    // Adicionar uma Receita ou atualizar seu nome
    if (receita.idReceita != null &&
        receita.idReceita.trim().isNotEmpty &&
        _items.containsKey(receita.idReceita)) {
      _items.update(
        receita.idReceita,
        (_) => Receita(
          idReceita: receita.idReceita,
          nomeReceita: receita.nomeReceita,
          imagemReceita: receita.imagemReceita,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Receita(
          idReceita: id,
          nomeReceita: receita.nomeReceita,
          imagemReceita: receita.imagemReceita,
        ),
      );
    }

    notifyListeners();
  }

  void remove(Receita receita) {
    if (receita != null && receita.idReceita != null) {
      _items.remove(receita.idReceita);
      notifyListeners();
    }
  }
}
