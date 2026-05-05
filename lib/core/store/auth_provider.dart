import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;
  String _name = '';
  String _email = '';

  bool get isAuthenticated => _isAuthenticated;
  String get name => _name;
  String get email => _email;

  void login({
    required String email,
    required String password,
  }) {
    if (email.trim().isEmpty || password.trim().isEmpty) return;
    _isAuthenticated = true;
    _email = email.trim();
    if (_name.trim().isEmpty) {
      _name = _email.split('@').first;
    }
    notifyListeners();
  }

  void signup({
    required String name,
    required String email,
    required String password,
  }) {
    if (name.trim().isEmpty || email.trim().isEmpty || password.trim().isEmpty) {
      return;
    }
    _isAuthenticated = true;
    _name = name.trim();
    _email = email.trim();
    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    _name = '';
    _email = '';
    notifyListeners();
  }
}
