import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  // add to cart
  void addToCart(Map<String, dynamic> item) {
    _cartItems.add({...item, 'quantity': 1});
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(String id) {
    _cartItems.removeWhere((item) => item['id'] == id);
    notifyListeners();
  }

  // clear cart
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  // get cart items count
  int get cartItemsCount => _cartItems.length;

  // get cart items total price
  double get cartItemsTotalPrice =>
      _cartItems.fold(0, (sum, item) => sum + item['price']);

  // get cart items total quantity
  int get cartItemsTotalQuantity =>
      _cartItems.fold(0, (sum, item) => sum + (item['quantity'] as int));

  // get cart items total weight
  double get cartItemsTotalWeight =>
      _cartItems.fold(0, (sum, item) => sum + (item['weight'] as double));

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
    return _cartItems.firstWhere((item) => item['id'] == id)['quantity'];
  }

  // decrement cart item quantity
  void decrementCartItemQuantity(String id) {
    final item = _cartItems.firstWhere((item) => item['id'] == id);
    item['quantity'] = (item['quantity'] as int) - 1;
    notifyListeners();
  }

  // increment cart item quantity
  void incrementCartItemQuantity(String id) {
    final item = _cartItems.firstWhere((item) => item['id'] == id);
    item['quantity'] = (item['quantity'] as int) + 1;
    notifyListeners();
  }
}
