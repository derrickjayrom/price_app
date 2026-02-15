import 'package:flutter/material.dart';
import 'package:price_app/data/section_header_items.dart';
import 'package:price_app/utils/app_colors.dart';
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
        ? (widget.selectedBg ?? context.colors.primary)
        : (widget.unselectedBg ?? context.scaffoldColor));

    final Color borderColor = widget.isSelected
        ? context.colors.primaryContainer
        : AppColors.transparent;

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

class TabBarItems extends StatefulWidget {
  const TabBarItems({super.key});

  @override
  State<TabBarItems> createState() => _TabBarItemsState();
}

class _TabBarItemsState extends State<TabBarItems> {
  int _selectedIndex = 0;

 
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(SectionHeaderItems.items.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TabBarItem(
              label: SectionHeaderItems.items[index].title,
              isSelected: _selectedIndex == index,
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          );
        }),
      ),
    );
  }
}
