import 'package:flutter/material.dart';

class BannerSliderList extends StatefulWidget {
  const BannerSliderList({super.key});

  @override
  State<BannerSliderList> createState() => _BannerSliderListState();
}

class _BannerSliderListState extends State<BannerSliderList> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> banners = const [
    'assets/images/banner/01.png',
    'assets/images/banner/01.png',
    'assets/images/banner/01.png',
    'assets/images/banner/01.png',
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
        SizedBox(
          height: 110,
          child: PageView.builder(
            controller: _pageController,
            itemCount: banners.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    banners[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            banners.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              height: 5,
              width: _currentIndex == index ? 18 : 5,
              decoration: BoxDecoration(
                color: _currentIndex == index
                    ? const Color(0xff53B175)
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
