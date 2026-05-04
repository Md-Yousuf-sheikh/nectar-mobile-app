import 'package:flutter/material.dart';
import 'package:nectar/core/store/items_provider.dart';
import 'package:nectar/modules/shop/widget/card/shop_product_card.dart';
import 'package:nectar/modules/shop/widget/card/shop_section_header.dart';
import 'package:provider/provider.dart';

class ExclusiveOfferList extends StatefulWidget {
  const ExclusiveOfferList({super.key});

  @override
  State<ExclusiveOfferList> createState() => _ExclusiveOfferListState();
}

class _ExclusiveOfferListState extends State<ExclusiveOfferList> {
  final PageController _pageController = PageController(viewportFraction: 0.48);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = context.watch<ItemsProvider>().getAllItems('exclusive');

    return Column(
      children: [
        const ShopSectionHeader(title: 'Exclusive Offer'),

        SizedBox(
          height: 230,
          child: PageView.builder(
            controller: _pageController,
            itemCount: items.length,
            padEnds: false,
            itemBuilder: (context, index) {
              final item = items[index];

              return ShopProductCard(item: item, index: index);
            },
          ),
        ),
      ],
    );
  }
}
