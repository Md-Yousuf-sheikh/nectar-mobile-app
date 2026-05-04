import 'package:flutter/material.dart';
import 'package:nectar/core/store/cart_provider.dart';
import 'package:nectar/modules/cart/widget/cart_product_card.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.watch<CartProvider>().cartItems;

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

      body: items.isEmpty
          ? Center(
              child: Text(
                'No items in cart',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  fontFeatures: [FontFeature.enable('smcp')],
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(bottom: 100),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return CartProductCard(item: items[index]);
              },
            ),
    );
  }
}
