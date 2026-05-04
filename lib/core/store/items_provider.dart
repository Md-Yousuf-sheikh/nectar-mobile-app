import 'package:flutter/material.dart';

final List<Map<String, dynamic>> seedCatalogItems = [
  {
    'title': 'Organic Bananas',
    'subtitle': '7pcs, Priceg',
    'image': 'assets/images/items/01.png',
    'price': '\$4.99',
  },
  {
    'title': 'Red Apple',
    'subtitle': '1kg, Priceg',
    'image': 'assets/images/items/02.png',
    'price': '\$4.99',
  },
  {
    'title': 'Red Apple',
    'subtitle': '1kg, Priceg',
    'image': 'assets/images/items/03.png',
    'price': '\$4.99',
  },
  {
    'title': 'Red Apple',
    'subtitle': '1kg, Priceg',
    'image': 'assets/images/items/04.png',
    'price': '\$4.99',
  },
];

class ItemsProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _items = [...seedCatalogItems];
  List<Map<String, dynamic>> get items => _items;

  void addItem(Map<String, dynamic> item) {
    _items.add(item);
    notifyListeners();
  }

  // remove item
  void removeItem(Map<String, dynamic> item) {
    _items.remove(item);
    notifyListeners();
  }

  // update item
  void updateItem(Map<String, dynamic> item) {
    _items[_items.indexOf(item)] = item;
    notifyListeners();
  }

  // get item by index
  Map<String, dynamic> getItemByIndex(int index) {
    return _items[index];
  }

  // get item by title
  Map<String, dynamic> getItemByTitle(String title) {
    return _items.firstWhere((item) => item['title'] == title);
  }

  // get item by subtitle
  Map<String, dynamic> getItemBySubtitle(String subtitle) {
    return _items.firstWhere((item) => item['subtitle'] == subtitle);
  }

  // get item by price
  Map<String, dynamic> getItemByPrice(String price) {
    return _items.firstWhere((item) => item['price'] == price);
  }

  // get item by image
  Map<String, dynamic> getItemByImage(String image) {
    return _items.firstWhere((item) => item['image'] == image);
  }

  //  get all items
  List<Map<String, dynamic>> getAllItems() {
    return _items;
  }
}
