import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends ChangeNotifier {
  static const _cartItemsKey = 'cart.items';

  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  double _priceValue(dynamic raw) {
    if (raw is num) return raw.toDouble();
    if (raw is String) {
      final cleaned = raw.replaceAll(RegExp(r'[^0-9.]'), '');
      return double.tryParse(cleaned) ?? 0;
    }
    return 0;
  }

  Future<void> loadFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_cartItemsKey) ?? <String>[];
    _cartItems
      ..clear()
      ..addAll(
        raw
            .map(
              (e) => Map<String, dynamic>.from(
                jsonDecode(e) as Map<String, dynamic>,
              ),
            )
            .toList(),
      );
    notifyListeners();
  }

  Future<void> _saveToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = _cartItems.map((e) => jsonEncode(e)).toList();
    await prefs.setStringList(_cartItemsKey, encoded);
  }

  // add to cart
  void addToCart(Map<String, dynamic> item) {
    final id = item['id'];
    final index = _cartItems.indexWhere((e) => e['id'] == id);
    if (index >= 0) {
      _cartItems[index]['quantity'] = (_cartItems[index]['quantity'] as int) + 1;
    } else {
      _cartItems.add({...item, 'quantity': 1});
    }
    _saveToStorage();
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(String id) {
    _cartItems.removeWhere((item) => item['id'] == id);
    _saveToStorage();
    notifyListeners();
  }

  // clear cart
  void clearCart() {
    _cartItems.clear();
    _saveToStorage();
    notifyListeners();
  }

  // get cart items count
  int get cartItemsCount => _cartItems.length;

  // get cart items total price
  double get cartItemsTotalPrice =>
      _cartItems.fold(0, (sum, item) => sum + _priceValue(item['price']));

  // get cart items total quantity
  int get cartItemsTotalQuantity =>
      _cartItems.fold(0, (sum, item) => sum + (item['quantity'] as int));

  // get cart items total weight
  double get cartItemsTotalWeight =>
      _cartItems.fold(
        0,
        (sum, item) => sum + ((item['weight'] as num?)?.toDouble() ?? 0),
      );

  // get all cart items
  Map<String, dynamic> getAllCartItems() {
    return {
      'items': _cartItems,
      'totalPrice': cartItemsTotalPrice,
      'totalQuantity': cartItemsTotalQuantity,
      'totalWeight': cartItemsTotalWeight,
    };
  }

  // check if item is in cart
  bool isItemInCart(String id) {
    return _cartItems.any((item) => item['id'] == id);
  }

  // get cart item quantity
  int getCartItemQuantity(String id) {
    final found = _cartItems.where((item) => item['id'] == id);
    if (found.isEmpty) return 0;
    return found.first['quantity'] as int;
  }

  // decrement cart item quantity
  void decrementCartItemQuantity(String id) {
    final item = _cartItems.firstWhere((item) => item['id'] == id);
    item['quantity'] = (item['quantity'] as int) - 1;
    if ((item['quantity'] as int) <= 0) {
      _cartItems.removeWhere((e) => e['id'] == id);
    }
    _saveToStorage();
    notifyListeners();
  }

  // increment cart item quantity
  void incrementCartItemQuantity(String id) {
    final item = _cartItems.firstWhere((item) => item['id'] == id);
    item['quantity'] = (item['quantity'] as int) + 1;
    _saveToStorage();
    notifyListeners();
  }
}
