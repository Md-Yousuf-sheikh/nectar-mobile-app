import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterProvider extends ChangeNotifier {
  static const _counterKey = 'counter.value';

  int _count = 0;
  int get count => _count;

  Future<void> loadFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    _count = prefs.getInt(_counterKey) ?? 0;
    notifyListeners();
  }

  Future<void> _saveToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_counterKey, _count);
  }

  void increment() {
    _count++;
    _saveToStorage();
    notifyListeners(); // This triggers the UI update (like dispatch)
  }

  // decrement
  void decrement() {
    _count--;
    _saveToStorage();
    notifyListeners(); // This triggers the UI update (like dispatch)
  }
}
