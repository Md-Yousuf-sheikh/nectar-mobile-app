import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _favorites = [];
  List<Map<String, dynamic>> get favorites => _favorites;

  void addFavorite(Map<String, dynamic> item) {
    _favorites.add(item);
    notifyListeners();
  }

  // remove favorite
  void removeFavorite(Map<String, dynamic> item) {
    _favorites.remove(item);
    notifyListeners();
  }
}
