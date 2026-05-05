import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  static const _authKey = 'auth.isAuthenticated';
  static const _nameKey = 'auth.name';
  static const _emailKey = 'auth.email';

  bool _isAuthenticated = false;
  String _name = '';
  String _email = '';

  bool get isAuthenticated => _isAuthenticated;
  String get name => _name;
  String get email => _email;

  Future<void> loadFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    _isAuthenticated = prefs.getBool(_authKey) ?? false;
    _name = prefs.getString(_nameKey) ?? '';
    _email = prefs.getString(_emailKey) ?? '';
    notifyListeners();
  }

  Future<void> _saveToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_authKey, _isAuthenticated);
    await prefs.setString(_nameKey, _name);
    await prefs.setString(_emailKey, _email);
  }

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
    _saveToStorage();
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
    _saveToStorage();
    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    _name = '';
    _email = '';
    _saveToStorage();
    notifyListeners();
  }
}
