import 'package:flutter/material.dart';
import 'package:nectar/modules/favorite/widget/favorite_product_card.dart';

class FavoriteScreen extends StatelessWidget {
  // Favorite
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _items = const [
      {
        'title': 'Fresh Fruits & Vegetable',
        'image': 'assets/images/items/06.png',
        'color': Color(0xff53B175),
      },
      {
        'title': 'Fresh Fruits & Vegetable',
        'image': 'assets/images/items/07.png',
        'color': Color(0xff53B175),
      },
      {
        'title': 'Fresh Fruits & Vegetable',
        'image': 'assets/images/items/02.png',
        'color': Color(0xff53B175),
      },
      {
        'title': 'Fresh Fruits & Vegetable',
        'image': 'assets/images/items/03.png',
        'color': Color(0xff53B175),
      },
      {
        'title': 'Fresh Fruits & Vegetable',
        'image': 'assets/images/items/04.png',
        'color': Color(0xff53B175),
      },
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Favorite',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: const Color(0xffE2E2E2)),
        ),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return FavoriteProductCard(item: _items[index]);
        },
      ),
    );
  }
}
