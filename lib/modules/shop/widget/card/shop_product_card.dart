import 'package:flutter/material.dart';

class ShopProductCard extends StatefulWidget {
  const ShopProductCard({super.key, required this.item, required this.index});
  final Map<String, dynamic> item;
  final int index;

  @override
  State<ShopProductCard> createState() => _ShopProductCardState();
}

class _ShopProductCardState extends State<ShopProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: widget.index == 0 ? 16 : 8, right: 8),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xffE2E2E2)),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                widget.item['image'] as String,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              widget.item['title'] as String,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),

            const SizedBox(height: 4),

            Text(
              widget.item['subtitle'] as String,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const Spacer(),

            Row(
              children: [
                Text(
                  widget.item['price'] as String,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xff53B175),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 28),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
