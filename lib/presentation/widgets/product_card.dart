import 'package:flutter/material.dart';
import 'package:price_app/utils/app_colors.dart';
import 'package:price_app/utils/extention.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final String category;
  final double rating;
  final String lowestPriceStore;
  final String price;
  final String originalPrice;

  const ProductCard({
    super.key,
    required this.name,
    required this.imagePath,
    required this.category,
    required this.rating,
    required this.lowestPriceStore,
    required this.price,
    required this.originalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.colors.primaryFixedDim),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image placeholder
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black, // Placeholder for image bg
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Category and Rating
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category.toUpperCase(),
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: AppColors.dYellow, size: 12),
                  const SizedBox(width: 4),
                  Text(
                    rating.toString(),
                    style: context.textTheme.labelSmall?.copyWith(
                      color: AppColors.dYellow,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Product Name
          Text(
            name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colors.onSurface,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),

          // Store info
          Text(
            'Lowest at $lowestPriceStore',
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),

          // Price
          Row(
            children: [
              Text(
                '₵',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colors.onSurface,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                price,
                style: context.textTheme.titleLarge?.copyWith(
                  color: context.colors.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Compare Button
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color:context.colors.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Compare',
                  style: context.textTheme.labelMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_forward, size: 14, color: Colors.black),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
