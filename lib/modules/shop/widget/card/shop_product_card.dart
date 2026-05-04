import 'package:flutter/material.dart';
import 'package:nectar/core/store/cart_provider.dart';
import 'package:provider/provider.dart';

class ShopProductCard extends StatefulWidget {
  const ShopProductCard({super.key, required this.item, required this.index});
  final Map<String, dynamic> item;
  final int index;

  @override
  State<ShopProductCard> createState() => _ShopProductCardState();
}

class _ShopProductCardState extends State<ShopProductCard> {
  bool _addButtonPressed = false;

  /// Matches [CartProvider.isItemInCart] / [CartProvider.removeFromCart] keys.
  String get _cartItemId {
    final raw = widget.item['id'];
    if (raw is String && raw.isNotEmpty) return raw;
    return widget.item['image'] as String;
  }

  @override
  Widget build(BuildContext context) {
    final isInCart = context.watch<CartProvider>().isItemInCart(_cartItemId);

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
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    enableFeedback: true,
                    onTapDown: (_) => setState(() => _addButtonPressed = true),
                    onTapUp: (_) => setState(() => _addButtonPressed = false),
                    onTapCancel: () =>
                        setState(() => _addButtonPressed = false),
                    onTap: () {
                      context.read<CartProvider>().addToCart({
                        ...widget.item,
                        'id': _cartItemId,
                      });
                    },
                    borderRadius: BorderRadius.circular(14),
                    splashColor: Colors.white.withValues(alpha: 0.35),
                    highlightColor: Colors.white.withValues(alpha: 0.2),
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 120),
                      curve: Curves.easeOut,
                      opacity: _addButtonPressed ? 0.65 : 1,
                      child: Container(
                        height: 44,
                        width: 44,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isInCart
                              ? const Color(0xff53B175).withValues(alpha: 0.45)
                              : const Color(0xff53B175),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(
                          isInCart ? Icons.check : Icons.add,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
