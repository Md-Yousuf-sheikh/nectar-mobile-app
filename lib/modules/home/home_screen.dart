import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        toolbarHeight: 90,
        centerTitle: true,
        backgroundColor: Colors.white,
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

      body: Column(
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

          const SizedBox(height: 40),

          const Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_bag, size: 64, color: Colors.green),
                  SizedBox(height: 16),
                  Text(
                    'Welcome to Nectar',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Your grocery store at fingertips',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
