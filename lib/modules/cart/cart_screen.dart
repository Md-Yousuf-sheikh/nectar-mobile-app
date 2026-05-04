import 'package:flutter/material.dart';
import 'package:nectar/modules/cart/widget/cart_product_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: const Color(0xffE2E2E2)),
        ),
        title: const Text(
          'Cart',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 100), // Space for button
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return CartProductCard(item: _items[index]);
        },
      ),
    );
  }
}
