import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _favorites = [];
  List<Map<String, dynamic>> get favorites => List.unmodifiable(_favorites);

  static String itemKey(Map<String, dynamic> item) {
    final raw = item['id'];
    if (raw is String && raw.isNotEmpty) return raw;
    return item['image'] as String;
  }

  bool isFavorite(String key) =>
      _favorites.any((e) => itemKey(e) == key);

  void toggleFavorite(Map<String, dynamic> item) {
    final key = itemKey(item);
    final index = _favorites.indexWhere((e) => itemKey(e) == key);
    if (index >= 0) {
      _favorites.removeAt(index);
    } else {
      _favorites.add({...item, 'id': key});
    }
    notifyListeners();
  }

  void addFavorite(Map<String, dynamic> item) {
    final key = itemKey(item);
    if (isFavorite(key)) return;
    _favorites.add({...item, 'id': key});
    notifyListeners();
  }

  void removeFavorite(Map<String, dynamic> item) {
    final key = itemKey(item);
    _favorites.removeWhere((e) => itemKey(e) == key);
    notifyListeners();
  }
}
