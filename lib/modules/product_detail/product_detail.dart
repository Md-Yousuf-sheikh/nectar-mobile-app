import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        'assets/images/items/05.png',
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
                          const Text(
                            "Naturel Red Apple",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.favorite_border, color: Colors.grey[400]),
                        ],
                      ),
                      const Text(
                        "1kg, Price",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 25),

                      // Price and Counter
                      Row(
                        children: [
                          Icon(Icons.remove, color: Colors.grey[400]),
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
                            child: const Text(
                              "1",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(width: 15),
                          const Icon(Icons.add, color: Color(0xFF53B175)),
                          const Spacer(),
                          const Text(
                            "\$4.99",
                            style: TextStyle(
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
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        children: [
                          Text(
                            "Apples are nutritious. Apples may be good for weight loss. Apples may be good for your heart.",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 20),
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
          onPressed: () {},
          child: const Text(
            "Add To Basket",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
