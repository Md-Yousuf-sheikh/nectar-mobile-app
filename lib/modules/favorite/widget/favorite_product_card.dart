import 'package:flutter/material.dart';
import 'package:nectar/core/routing/routes.dart';
import 'package:go_router/go_router.dart';

class FavoriteProductCard extends StatefulWidget {
  const FavoriteProductCard({super.key, required this.item});

  final Map<String, dynamic> item;

  @override
  State<FavoriteProductCard> createState() => _FavoriteProductCardState();
}

class _FavoriteProductCardState extends State<FavoriteProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(PageRoutes.productDetail, extra: widget.item),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
        ),
        child: Row(
          children: [
            // 1. Product Image
            Image.asset(
              widget.item['image'] as String,
              width: 60,
              height: 60,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 20),

            // 2. Middle Content (Text and Quantity)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.item['title'] as String,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight(600),
                            ),
                          ),
                          Text(
                            widget.item['subtitle'] as String,
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),

                      // price and arrow
                      Row(
                        spacing: 5,
                        children: [
                          Text(
                            widget.item['price'] as String,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight(500),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
