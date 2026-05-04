import 'package:flutter/material.dart';
import 'package:nectar/core/store/favorite_provider.dart';
import 'package:nectar/modules/favorite/widget/favorite_product_card.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  // Favorite
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.watch<FavoriteProvider>().favorites;
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
        itemCount: items.length,
        itemBuilder: (context, index) {
          return FavoriteProductCard(item: items[index]);
        },
      ),
    );
  }
}
