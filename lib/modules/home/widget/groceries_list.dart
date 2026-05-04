import 'package:flutter/material.dart';

class GroceriesList extends StatefulWidget {
  const GroceriesList({super.key});

  @override
  State<GroceriesList> createState() => _GroceriesListState();
}

class _GroceriesListState extends State<GroceriesList> {
  final PageController _pageController = PageController(viewportFraction: 0.48);

  final List<Map<String, String>> bestSelling = const [
    {
      'title': 'Organic Bananas',
      'subtitle': '7pcs, Priceg',
      'image': 'assets/images/items/01.png',
      'price': '\$4.99',
    },
    {
      'title': 'Red Apple',
      'subtitle': '1kg, Priceg',
      'image': 'assets/images/items/02.png',
      'price': '\$4.99',
    },
    {
      'title': 'Red Apple',
      'subtitle': '1kg, Priceg',
      'image': 'assets/images/items/03.png',
      'price': '\$4.99',
    },
    {
      'title': 'Red Apple',
      'subtitle': '1kg, Priceg',
      'image': 'assets/images/items/04.png',
      'price': '\$4.99',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Text(
                'Best Selling',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'See all',
                  style: TextStyle(
                    color: Color(0xff53B175),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: 230,
          child: PageView.builder(
            controller: _pageController,
            itemCount: bestSelling.length,
            padEnds: false,
            itemBuilder: (context, index) {
              final item = bestSelling[index];

              return Padding(
                padding: EdgeInsets.only(left: index == 0 ? 16 : 8, right: 8),
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
                          item['image']!,
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                      ),

                      const SizedBox(height: 16),

                      Text(
                        item['title']!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        item['subtitle']!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),

                      const Spacer(),

                      Row(
                        children: [
                          Text(
                            item['price']!,
                            style: const TextStyle(
                              fontSize: 16,
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
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
