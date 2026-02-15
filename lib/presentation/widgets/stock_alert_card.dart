import 'package:flutter/material.dart';
import 'package:price_app/utils/app_colors.dart';
import 'package:price_app/utils/extention.dart';

class StockAlertCard extends StatelessWidget {
  const StockAlertCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.colors.secondaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Stock Alert',
                      style: context.textTheme.titleLarge?.copyWith(
                        color: context.colors.onSurface,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.notifications_active,
                      color: AppColors.dYellow,
                      size: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Get notified when prices drop for your essentials.',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Set Alert',
                    style: context.textTheme.labelMedium?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Bell Icon (Placeholder or SVG)
          Opacity(
            opacity: 0.1,
            child: Icon(
              Icons.notifications,
              size: 80,
              color: AppColors.primary,
            ),
            // If we had the SVG for the big bell, we'd use it here
            //  SvgPicture.asset(
            //   AppIcons.bell,
            //   width: 80,
            //   height: 80,
            //   colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
            // ),
          ),
        ],
      ),
    );
  }
}
