import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:price_app/models/product_model.dart';
import 'package:price_app/presentation/widgets/image_loader.dart';
import 'package:price_app/utils/app_colors.dart';
import 'package:price_app/utils/extention.dart';
import 'package:price_app/widget/app_button_one.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.colors.secondary,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.colors.primaryFixedDim),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         ImageLoader(
          isAsset: true,
          fit: BoxFit.fitWidth,
          imageUrl: product.imagePath,
          height: 100,
          width: double.infinity,
          borderRadius: BorderRadius.circular(12),
         ),
          Gap(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.category.toUpperCase(),
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
                    product.rating.toString(),
                    style: context.textTheme.labelSmall?.copyWith(
                      color: AppColors.dYellow,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gap(8),
          Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colors.onSurface,
              height: 1.2,
            ),
          ),
          Gap(8),
          Text(
            'Lowest at ${product.lowestPriceStore}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
          Gap(8),
          Row(
            children: [
              Text(
                '₵',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colors.onSurface,
                ),
              ),
             Gap(4),
              Text(
                product.price,
                style: context.textTheme.titleLarge?.copyWith(
                  color: context.colors.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Gap(12),
         AppButton(
          radius: 8,
          isLoading: false,
          height: 30,
          trailing: Icon(
            Icons.arrow_forward,
            color: context.colors.onPrimary,
            size: 14,
          ),
          isTextButton: true,
          title: 'Compare',
          bgColor: context.colors.primary,
          textStyle: context.textTheme.labelMedium?.copyWith(
            color: context.colors.onPrimary,
            fontWeight: FontWeight.bold,
          ),
          onTap: () {},
         )
        ],
      ),
    );
  }
}
