import 'package:flutter/material.dart';

class ShopSectionHeader extends StatelessWidget {
  const ShopSectionHeader({
    super.key,
    required this.title,
    this.onSeeAll,
    this.horizontalPadding = 16,
  });

  final String title;
  final VoidCallback? onSeeAll;
  final double horizontalPadding;

  static const _titleStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );

  static const _seeAllStyle = TextStyle(
    color: Color(0xff53B175),
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Row(
        children: [
          Text(title, style: _titleStyle),
          const Spacer(),
          TextButton(
            onPressed: onSeeAll ?? () {},
            child: const Text('See all', style: _seeAllStyle),
          ),
        ],
      ),
    );
  }
}
