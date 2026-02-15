import 'package:flutter/material.dart';
import 'package:price_app/data/models/tab_item_model.dart';
import 'package:price_app/data/section_header_items.dart';
import 'package:price_app/presentation/notifier/ui_provider.dart';
import 'package:price_app/presentation/widgets/tab_bar_items.dart';
import 'package:price_app/utils/extention.dart';
import 'package:provider/provider.dart';

class CustomTabContainer extends StatefulWidget {
  final List<TabItemModel>? items;
  final ValueChanged<int>? onTabSelected;
  final int? selectedIndex;
  final Future<void> Function(int index)? onTap;
  const CustomTabContainer({
    super.key,
    this.items,
    this.onTabSelected,
    this.selectedIndex,
    this.onTap,
  });

  @override
  State<CustomTabContainer> createState() => _CustomTabContainerState();
}

class _CustomTabContainerState extends State<CustomTabContainer> {
  @override
  Widget build(BuildContext context) {
    final uiNotifier = context.watch<UiNotifier>();
    final items = widget.items ?? SectionHeaderItems.items;
    final maintainDefaultColor = widget.items == null;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(items.length, (i) {
          return TabBarItem(
            label: items[i].title,
            isSelected: uiNotifier.secondSelectedIndex == i,
            maintainDefaultColor: maintainDefaultColor,
            onTap: () {
              if (widget.onTap != null) {
                widget.onTap!(i);
              }
              setState(() => uiNotifier.secondSelectedIndex = i);
              if (widget.items != null && widget.onTabSelected != null) {
                widget.onTabSelected!(i);
              }
            },
          );
        }),
      ).padding14h,
    );
  }
}
