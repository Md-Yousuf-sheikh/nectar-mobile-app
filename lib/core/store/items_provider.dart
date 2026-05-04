import 'package:flutter/material.dart';

final Map<String, String> itemTypes = {
  'best-selling': 'best-selling',
  'exclusive': 'exclusive',
  'groceries': 'groceries',
};

final List<Map<String, dynamic>> seedCatalogItems = [
  {
    'title': 'Broad Style Egg Noodles',
    'subtitle': '400g',
    'image': 'assets/images/items/01.png',
    'price': '\$2.99',
    'type': itemTypes['best-selling']!,
  },
  {
    'title': 'Red Bell Pepper',
    'subtitle': '500g',
    'image': 'assets/images/items/02.png',
    'price': '\$3.49',
    'type': itemTypes['best-selling']!,
  },
  {
    'title': "Chang's Egg Noodles",
    'subtitle': '250g · 3 packs',
    'image': 'assets/images/items/03.png',
    'price': '\$2.49',
    'type': itemTypes['groceries']!,
  },
  {
    'title': 'Fresh Dairy & Eggs',
    'subtitle': 'Assorted · family pack',
    'image': 'assets/images/items/04.png',
    'price': '\$18.99',
    'type': itemTypes['groceries']!,
  },
  {
    'title': 'Fresh Red Apples',
    'subtitle': '1 kg',
    'image': 'assets/images/items/05.png',
    'price': '\$4.99',
    'type': itemTypes['best-selling']!,
  },
  {
    'title': 'Extra Virgin Olive Oil',
    'subtitle': '500ml',
    'image': 'assets/images/items/06.png',
    'price': '\$11.99',
    'type': itemTypes['groceries']!,
  },
  {
    'title': 'Sprite',
    'subtitle': '355ml',
    'image': 'assets/images/items/07.png',
    'price': '\$1.29',
    'type': itemTypes['exclusive']!,
  },
  {
    'title': 'Pepsi',
    'subtitle': '355ml',
    'image': 'assets/images/items/08.png',
    'price': '\$1.19',
    'type': itemTypes['exclusive']!,
  },
  {
    'title': 'Tree Top Orange Pineapple Juice',
    'subtitle': '1.89 L',
    'image': 'assets/images/items/09.png',
    'price': '\$4.49',
    'type': itemTypes['exclusive']!,
  },
  {
    'title': 'Mixed Pulses & Legumes',
    'subtitle': '1 kg',
    'image': 'assets/images/items/10.png',
    'price': '\$5.99',
    'type': itemTypes['groceries']!,
  },
  {
    'title': 'Long Grain White Rice',
    'subtitle': '1 kg',
    'image': 'assets/images/items/11.png',
    'price': '\$3.29',
    'type': itemTypes['best-selling']!,
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
  List<Map<String, dynamic>> getAllItems(String type) {
    return _items.where((item) => item['type'] == type).toList();
  }
}
