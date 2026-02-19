import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:price_app/utils/extention.dart';
import 'package:price_app/widget/app_button_one.dart';

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
                      'Stock Alert 🔔',
                      style: context.textTheme.titleLarge?.copyWith(
                        color: context.colors.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Gap(6),
                Text(
                  'Get notified when prices drop for your essentials.',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colors.onPrimary,
                  ),
                ),
                Gap(16),
                AppButton(
                  onTap: () {},
                  radius: 8,
                  height: 30,
                  isTextButton: true,
                  bgColor: context.colors.primary,
                  title: 'Set Alert',
                  textStyle: context.textTheme.labelMedium?.copyWith(
                    color: context.colors.onPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          // Bell Icon (Placeholder or SVG)
          Icon(
            Icons.notifications,
            size: 80,
            color: context.colors.onPrimaryContainer,
          ),
        ],
      ),
    );
  }
}
