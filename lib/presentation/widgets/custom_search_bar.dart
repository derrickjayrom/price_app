import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:price_app/utils/app_colors.dart';
import 'package:price_app/utils/app_icons.dart';
import 'package:price_app/utils/extention.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: context.colors.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.colors.primaryFixedDim),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          SvgPicture.asset(
            AppIcons.search,
            colorFilter: ColorFilter.mode(
              context.colors.onSurfaceVariant,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Find rice, iPhones, oil...',
                hintStyle: context.textTheme.bodyMedium?.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colors.onSurface,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(
                alpha: 0.2,
              ), // Light green tint
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(
              AppIcons.filter,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
              width: 20,
              height: 20,
            ),
          ),
        ],
      ),
    );
  }
}
