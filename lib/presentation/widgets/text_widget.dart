import 'package:flutter/material.dart';
import 'package:price_app/utils/extention.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final String? viewAllText;
  final TextStyle? viewAllStyle;
  final bool showViewAll;
  final VoidCallback? viewAllOnTap;
  const TextWidget({
    super.key,
    required this.text,
    this.style,
    this.viewAllText,
    this.viewAllStyle,
    this.showViewAll = true,
    this.viewAllOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style:
              style ??
              context.textTheme.titleMedium?.copyWith(
                color: context.colors.onSurfaceVariant,
                fontWeight: FontWeight.bold,
              ),
        ),
        if (showViewAll)
          InkWell(
            onTap: viewAllOnTap,
            child: Text(
              viewAllText ?? 'View All',
              style:
                  viewAllStyle ??
                  context.textTheme.labelMedium?.copyWith( 
                    color: context.colors.primary,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
      ],
    );
  }
}
