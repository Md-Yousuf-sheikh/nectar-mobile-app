import 'package:flutter/material.dart';
import 'package:nectar/core/store/cart_provider.dart';
import 'package:nectar/core/store/favorite_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final Map<String, dynamic> product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String get _itemId {
    final raw = widget.product['id'];
    if (raw is String && raw.isNotEmpty) return raw;
    return _image;
  }

  String get _title => _readValue('title', 'Naturel Red Apple');

  String get _subtitle => _readValue('subtitle', '1kg, Price');

  String get _price => _readValue('price', '\$4.99');

  String get _image => _readValue('image', 'assets/images/items/05.png');

  String get _description => _readValue(
    'description',
    '$_title is fresh and nutritious. It is a great choice for everyday meals.',
  );

  String _readValue(String key, String fallback) {
    final value = widget.product[key];
    if (value is String && value.trim().isNotEmpty) {
      return value;
    }
    return fallback;
  }

  void _increaseQuantity(CartProvider cartProvider) {
    final inCart = cartProvider.isItemInCart(_itemId);
    if (!inCart) {
      cartProvider.addToCart({...widget.product, 'id': _itemId});
      return;
    }
    cartProvider.incrementCartItemQuantity(_itemId);
  }

  void _decreaseQuantity(CartProvider cartProvider) {
    final inCart = cartProvider.isItemInCart(_itemId);
    if (!inCart) return;
    final quantity = cartProvider.getCartItemQuantity(_itemId);
    if (quantity <= 1) {
      cartProvider.removeFromCart(_itemId);
      return;
    }
    cartProvider.decrementCartItemQuantity(_itemId);
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    final favoriteProvider = context.watch<FavoriteProvider>();
    final isInCart = cartProvider.isItemInCart(_itemId);
    final quantity = isInCart ? cartProvider.getCartItemQuantity(_itemId) : 0;
    final isFavorite = favoriteProvider.isFavorite(_itemId);

    return Scaffold(
      backgroundColor: Colors.white,
      // We use Stack to keep the header "Fixed" on top of the scrolling content
      body: Stack(
        children: [
          // 1. SCROLLABLE CONTENT
          SingleChildScrollView(
            child: Column(
              children: [
                // Top Image Section (Background extends to top)
                Container(
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Image.asset(
                        _image,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                // Details Section
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            visualDensity: VisualDensity.compact,
                            onPressed: () {
                              context.read<FavoriteProvider>().toggleFavorite({
                                ...widget.product,
                                'id': _itemId,
                              });
                            },
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorite
                                  ? const Color(0xffFF324B)
                                  : Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        _subtitle,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 25),

                      // Price and Counter
                      Row(
                        children: [
                          InkWell(
                            onTap: () => _decreaseQuantity(
                              context.read<CartProvider>(),
                            ),
                            child: Icon(Icons.remove, color: Colors.grey[400]),
                          ),
                          const SizedBox(width: 15),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              '$quantity',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(width: 15),
                          InkWell(
                            onTap: () => _increaseQuantity(
                              context.read<CartProvider>(),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Color(0xFF53B175),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            _price,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      Divider(height: 20, color: Colors.grey[200]),

                      // Expandable Details
                      ExpansionTile(
                        initiallyExpanded: true,
                        shape: const Border(
                          top: BorderSide.none,
                          bottom: BorderSide(color: Color(0xFFEEEEEE)),
                        ),
                        collapsedShape: const Border(
                          top: BorderSide.none,
                          bottom: BorderSide(color: Color(0xFFEEEEEE)),
                        ),
                        tilePadding: EdgeInsets.zero,
                        title: Text(
                          "Product Detail",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        children: [
                          Text(
                            _description,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),

                      // Nutritions Row
                      _buildListRow(
                        "Nutritions",
                        trailing: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            "100gr",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                      ),

                      // Review Row
                      _buildListRow(
                        "Review",
                        trailing: const Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Color(0xFFF3603F),
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Color(0xFFF3603F),
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Color(0xFFF3603F),
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Color(0xFFF3603F),
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Color(0xFFF3603F),
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 2. FIXED HEADER (On top of the scroll view)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                    onPressed: () => Navigator.pop(context),
                  ),
                  IconButton(
                    icon: const Icon(Icons.ios_share),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF53B175),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {
            final provider = context.read<CartProvider>();
            if (isInCart) {
              provider.removeFromCart(_itemId);
              return;
            }
            provider.addToCart({...widget.product, 'id': _itemId});
          },
          child: Text(
            isInCart ? "Remove From Basket" : "Add To Basket",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // build list row
  Widget _buildListRow(String title, {required Widget trailing}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Row(
            children: [
              trailing,
              const SizedBox(width: 10),
              const Icon(Icons.chevron_right),
            ],
          ),
        ],
      ),
    );
  }
}
