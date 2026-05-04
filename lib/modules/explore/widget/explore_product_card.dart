import 'package:flutter/material.dart';

class ExploreProductCard extends StatelessWidget {
  const ExploreProductCard({super.key, required this.item});

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    final baseColor = item['color'] as Color? ?? const Color(0xff53B175);
    final image = item['image'] as String;
    final title = item['title'] as String;

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: baseColor.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: baseColor.withValues(alpha: 0.70), width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image.asset(image, fit: BoxFit.contain)),
          const SizedBox(height: 15),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF181725),
            ),
          ),
        ],
      ),
    );
  }
}
