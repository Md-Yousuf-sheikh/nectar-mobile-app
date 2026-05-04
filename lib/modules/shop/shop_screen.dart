import 'package:flutter/material.dart';
import 'package:nectar/modules/shop/widget/banner_slider_list.dart';
import 'package:nectar/modules/shop/widget/best_selling_list.dart';
import 'package:nectar/modules/shop/widget/exclusive_offer_list.dart';
import 'package:nectar/modules/shop/widget/groceries_list.dart';
import 'package:flutter/services.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 75,
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
        ),
        // backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/icons/header_icon.png', height: 28),
            const SizedBox(height: 6),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_pin, color: Colors.black, size: 20),
                SizedBox(width: 4),
                Text(
                  'Dhaka, Banassre',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Store',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: const Color(0xFFF2F3F2),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            BannerSliderList(),
            ExclusiveOfferList(),
            BestSellingList(),
            GroceriesList(),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
