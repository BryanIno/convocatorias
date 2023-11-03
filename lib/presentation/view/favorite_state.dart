import 'package:flutter/material.dart';

class FavoritosState extends ChangeNotifier {
  List<String> favoritos = [];

  void toggleFavorito(String producto) {
    if (favoritos.contains(producto)) {
      favoritos.remove(producto);
    } else {
      favoritos.add(producto);
    }

    notifyListeners();
  }
}
