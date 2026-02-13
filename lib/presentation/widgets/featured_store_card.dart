import 'package:flutter/material.dart';
import 'package:price_app/utils/extention.dart';

class FeaturedStoreCard extends StatelessWidget {
  final String name;
  final String imagePath;

  const FeaturedStoreCard({
    super.key,
    required this.name,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 80,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(imagePath), // Assuming local asset for now
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black.withValues(alpha: 0.7)],
          ),
        ),
        padding: const EdgeInsets.all(8),
        alignment: Alignment.bottomLeft,
        child: Text(
          name,
          style: context.textTheme.labelMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
