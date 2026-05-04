import 'package:flutter/material.dart';
import 'package:nectar/core/store/counter_provider.dart';
import 'package:provider/provider.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({super.key, required this.item});

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    final quantity = context.watch<CounterProvider>().count;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xffE2E2E2))),
      ),
      child: Row(
        children: [
          // 1. Product Image
          Image.asset(
            item['image'],
            width: 70,
            height: 70,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 20),

          // 2. Middle Content (Text and Quantity)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 4,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item['title'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Icon(Icons.close, color: Colors.grey, size: 20),
                  ],
                ),
                const Text('1kg, Price', style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _quantityButton(
                      Icons.remove,
                      onPressed: () {
                        context.read<CounterProvider>().decrement();
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        '$quantity',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _quantityButton(
                      Icons.add,
                      color: const Color(0xff53B175),
                      onPressed: () {
                        context.read<CounterProvider>().increment();
                      },
                    ),
                    const Spacer(),
                    Text(
                      item['price'] ?? '\$4.99',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _quantityButton(
    IconData icon, {
    Color? color,
    VoidCallback? onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xffE2E2E2)),
        ),
        child: Icon(icon, size: 20, color: color ?? Colors.grey),
      ),
    );
  }
}
