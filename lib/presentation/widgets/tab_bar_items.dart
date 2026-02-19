import 'package:flutter/material.dart';
import 'package:price_app/utils/extention.dart';

class TabBarItem extends StatefulWidget {
  const TabBarItem({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.height = 40,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    this.radius = 700,
    this.selectedBg,
    this.unselectedBg,
    this.selectedBorderColor,
    this.unselectedBorderColor,
    this.selectedBorderWidth = 1,
    this.unselectedBorderWidth = 0,
    this.selectedTextStyle,
    this.unselectedTextStyle,
    this.maintainDefaultColor = true,
  });

 
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  final double height;
  final EdgeInsets padding;
  final double radius;

  final Color? selectedBg;
  final Color? unselectedBg;

  final Color? selectedBorderColor;
  final Color? unselectedBorderColor;
  final double selectedBorderWidth;
  final double unselectedBorderWidth;

  final TextStyle? selectedTextStyle;
  final TextStyle? unselectedTextStyle;
  final bool? maintainDefaultColor;

  @override
  State<TabBarItem> createState() => _TabBarItemState();
}

class _TabBarItemState extends State<TabBarItem> {
  @override
  Widget build(BuildContext context) {
    final Color bgColor = (widget.isSelected
        ? (widget.selectedBg ?? context.colors.onPrimary)
        : (widget.unselectedBg ?? context.colors.secondary));

    final Color borderColor = widget.isSelected
        ? context.colors.primary
        : context.colors.secondary;

    final double borderWidth = widget.isSelected
        ? widget.selectedBorderWidth
        : widget.unselectedBorderWidth;

    final TextStyle? textStyle = widget.isSelected
        ? (widget.selectedTextStyle ??
              context.textTheme.bodyMedium?.copyWith(
                color: (widget.maintainDefaultColor ?? true)
                    ? context.colors.primary
                    : context.colors.outlineVariant,
                fontSize: 13,
                height: 1,
              ))
        : widget.unselectedTextStyle ?? context.textTheme.bodyMedium;

    return Material(
      borderRadius: BorderRadius.circular(widget.radius),

      color: bgColor,
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(widget.radius),
        child: Container(
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius),
            border: Border.all(color: borderColor, width: borderWidth),
          ),
          alignment: Alignment.center,
          child: Text(
            widget.label,
            style: textStyle,
            overflow: TextOverflow.ellipsis,
          ).padding16h.padding10v,
        ),
      ),
    );
  }
}


