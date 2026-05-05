import 'package:flutter/material.dart';
// import 'package:nectar/core/routing/routes.dart';
import 'package:nectar/core/store/cart_provider.dart';
import 'package:nectar/modules/cart/widget/cart_product_card.dart';
import 'package:provider/provider.dart';
// import 'package:go_router/go_router.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  double _parsePrice(String price) {
    final cleaned = price.replaceAll(RegExp(r'[^0-9.]'), '');
    return double.tryParse(cleaned) ?? 0;
  }

  double _calculateTotal(List<Map<String, dynamic>> items) {
    return items.fold<double>(0, (sum, item) {
      final price = _parsePrice((item['price'] as String?) ?? '\$0');
      final quantity = (item['quantity'] as int?) ?? 1;
      return sum + (price * quantity);
    });
  }

  String _formatPrice(double value) => '\$${value.toStringAsFixed(2)}';

  int _totalQuantity(List<Map<String, dynamic>> items) {
    return items.fold<int>(
      0,
      (sum, item) => sum + ((item['quantity'] as int?) ?? 1),
    );
  }

  void _showCheckoutModal(
    BuildContext context,
    List<Map<String, dynamic>> items,
  ) {
    final total = _formatPrice(_calculateTotal(items));
    final totalItems = items.length;
    final totalQuantity = _totalQuantity(items);

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Checkout',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close, size: 28),
                      ),
                    ],
                  ),
                  const Divider(height: 20),
                  _summaryCard(
                    totalItems: totalItems,
                    totalQuantity: totalQuantity,
                    totalPrice: total,
                  ),
                  const SizedBox(height: 12),
                  _checkoutStaticRow(title: 'Delivery', value: 'Cash on Delivery'),
                  _checkoutStaticRow(title: 'Total Cost', value: total, isBold: true),
                  const SizedBox(height: 12),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                      children: const [
                        TextSpan(
                          text: 'By placing an order you agree to our\n',
                        ),
                        TextSpan(
                          text: 'Terms And Conditions',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    height: 62,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF53B175),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Place Order',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _summaryCard({
    required int totalItems,
    required int totalQuantity,
    required String totalPrice,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F7F8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        'Summary: $totalItems item(s), $totalQuantity quantity, total $totalPrice',
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xFF6B6B6B),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _checkoutStaticRow({
    required String title,
    required String value,
    bool isBold = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE2E2E2))),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

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
          'My Cart',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),

      body: items.isEmpty
          ? const Center(
              child: Text(
                'No items in cart',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
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

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1A000000),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              if (items.isEmpty) return;
              _showCheckoutModal(context, items);
            },
            child: const Text(
              'Checkout',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
