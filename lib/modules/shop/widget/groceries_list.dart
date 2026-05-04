import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/core/routing/routes.dart';
import 'package:nectar/core/store/items_provider.dart';
import 'package:provider/provider.dart';

class GroceriesList extends StatefulWidget {
  const GroceriesList({super.key});

  @override
  State<GroceriesList> createState() => _GroceriesListState();
}

class _GroceriesListState extends State<GroceriesList> {
  final PageController _pageController = PageController(viewportFraction: 0.48);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final groceries = context.watch<ItemsProvider>().getAllItems();
    final groceriesSmall = context.watch<ItemsProvider>().getAllItems();

    return Column(
      spacing: 10,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Text(
                'Groceries',
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

        // small card list
        SizedBox(
          height: 105,
          child: PageView.builder(
            itemCount: groceriesSmall.length,
            controller: PageController(viewportFraction: 0.70),
            padEnds: false,
            itemBuilder: (context, index) {
              final item = groceriesSmall[index];

              return InkWell(
                onTap: () => context.push(PageRoutes.productDetail),
                child: Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 16 : 8, right: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFfff2e6),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        Image.asset(
                          item['image']!,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            item['title']!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // big card list
        SizedBox(
          height: 230,
          child: PageView.builder(
            controller: _pageController,
            itemCount: groceries.length,
            padEnds: false,
            itemBuilder: (context, index) {
              final item = groceries[index];

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
