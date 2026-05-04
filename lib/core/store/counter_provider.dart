import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // This triggers the UI update (like dispatch)
  }

  // decrement
  void decrement() {
    _count--;
    notifyListeners(); // This triggers the UI update (like dispatch)
  }
}
