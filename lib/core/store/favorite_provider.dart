import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider extends ChangeNotifier {
  static const _favoritesKey = 'favorites.items';

  final List<Map<String, dynamic>> _favorites = [];
  List<Map<String, dynamic>> get favorites => List.unmodifiable(_favorites);

  static String itemKey(Map<String, dynamic> item) {
    final raw = item['id'];
    if (raw is String && raw.isNotEmpty) return raw;
    return item['image'] as String;
  }

  bool isFavorite(String key) =>
      _favorites.any((e) => itemKey(e) == key);

  Future<void> loadFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_favoritesKey) ?? <String>[];
    _favorites
      ..clear()
      ..addAll(
        raw
            .map(
              (e) => Map<String, dynamic>.from(
                jsonDecode(e) as Map<String, dynamic>,
              ),
            )
            .where((e) => e.isNotEmpty),
      );
    notifyListeners();
  }

  Future<void> _saveToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = _favorites.map((e) => jsonEncode(e)).toList();
    await prefs.setStringList(_favoritesKey, encoded);
  }

  void toggleFavorite(Map<String, dynamic> item) {
    final key = itemKey(item);
    final index = _favorites.indexWhere((e) => itemKey(e) == key);
    if (index >= 0) {
      _favorites.removeAt(index);
    } else {
      _favorites.add({...item, 'id': key});
    }
    _saveToStorage();
    notifyListeners();
  }

  void addFavorite(Map<String, dynamic> item) {
    final key = itemKey(item);
    if (isFavorite(key)) return;
    _favorites.add({...item, 'id': key});
    _saveToStorage();
    notifyListeners();
  }

  void removeFavorite(Map<String, dynamic> item) {
    final key = itemKey(item);
    _favorites.removeWhere((e) => itemKey(e) == key);
    _saveToStorage();
    notifyListeners();
  }
}
