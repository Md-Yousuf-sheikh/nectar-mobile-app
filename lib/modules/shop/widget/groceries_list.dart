import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/core/routing/routes.dart';
import 'package:nectar/core/store/items_provider.dart';
import 'package:nectar/modules/shop/widget/card/shop_product_card.dart';
import 'package:nectar/modules/shop/widget/card/shop_section_header.dart';
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
    final groceries = context.watch<ItemsProvider>().getAllItems('groceries');
    final groceriesSmall = context.watch<ItemsProvider>().getAllItems(
      'groceries',
    );

    return Column(
      spacing: 10,
      children: [
        const ShopSectionHeader(title: 'Groceries'),

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
                onTap: () => context.push(PageRoutes.productDetail, extra: item),
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
              return ShopProductCard(item: item, index: index);
            },
          ),
        ),
      ],
    );
  }
}
