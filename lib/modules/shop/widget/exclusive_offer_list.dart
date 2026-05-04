import 'package:flutter/material.dart';
import 'package:nectar/core/store/items_provider.dart';
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
    final items = context.watch<ItemsProvider>().getAllItems();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Text(
                'Exclusive Offer',
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
            itemCount: items.length,
            padEnds: false,
            itemBuilder: (context, index) {
              final item = items[index];

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
                          item['image'] as String,
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                      ),

                      const SizedBox(height: 16),

                      Text(
                        item['title'] as String,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        item['subtitle'] as String,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),

                      const Spacer(),

                      Row(
                        children: [
                          Text(
                            item['price'] as String,
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
