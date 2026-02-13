import 'package:flutter/material.dart';
import 'package:price_app/utils/extention.dart';

class CategoryFilter extends StatefulWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryFilter({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<CategoryFilter> createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: widget.isSelected
              ? context.colors.primary
              : context.colors.surfaceContainer,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: widget.isSelected
                ? context.colors.primary
                : context.colors.outline,
          ),
        ),
        child: Text(
          widget.label,
          style: context.textTheme.labelMedium?.copyWith(
            color: widget.isSelected ? Colors.black : context.colors.onSurface,
            fontWeight: widget.isSelected ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
