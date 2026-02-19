import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:price_app/data/filter_data.dart';
import 'package:price_app/presentation/notifier/ui_provider.dart';
import 'package:price_app/utils/extention.dart';
import 'package:price_app/widget/app_button_one.dart';
import 'package:provider/provider.dart';


class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    final uINotifier = context.watch<UiNotifier>();
    final filterItems = FilterData.filterItems;

    return Container(
      decoration: BoxDecoration(
        color: context.colors.tertiary,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          strokeAlign: BorderSide.strokeAlignInside,
          color: context.colors.surfaceContainer,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => context.pop(),
                icon: Icon(Icons.arrow_back),
              ),
              Container(
                height: 6,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(120),
                  color: context.textTheme.labelSmall!.color!,
                ),
              ),
              AppButton(
                onTap: () {
                  context.pop();
                },
                bgColor: context.colors.primary,
                width: 57,
                height: 26,
                radius: 70,
                title: 'Apply',
                textStyle: context.textTheme.labelMedium?.copyWith(
                  color: context.colors.onPrimary,
                  fontSize: 14,
                ),
              ),
            ],
          ).paddingL(8).paddingR(18),

          Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 15),
            decoration: BoxDecoration(
              color: context.colors.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(14.8),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: filterItems.length,
              itemBuilder: (context, i) {
                final isSelected = uINotifier.isFilterSelected(
                  filterItems[i].filterValue,
                );

                return _FilterPill(
                  title: filterItems[i].name,
                  selected: isSelected,
                  onTap: () {
                    uINotifier.toggleFilterSelection(
                      filterItems[i].filterValue,
                    );
                    ("Option : ${filterItems[i].filterValue}");
                  },
                );
              },
              separatorBuilder: (_, _) => const Gap(12),
            ),
          ).paddingB(16).paddingH(17),
        ],
      ),
    ).padding16h.paddingT(14).paddingB(22);
  }
}

class _FilterPill extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _FilterPill({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(92),
      child: InkWell(
        borderRadius: BorderRadius.circular(92),
        onTap: () => onTap(),
        child: Container(
          height: 34,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(92),
            color: selected
                ? context.colors.surfaceContainer
                : context.colors.secondary,
            border: Border.all(
              color: selected
                  ? context.colors.primary
                  : context.textTheme.labelMedium!.color!,
              width: 1,
              strokeAlign: BorderSide.strokeAlignInside,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: selected,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: const VisualDensity(
                  horizontal: -4,
                  vertical: -4,
                ),
                activeColor: context.colors.primary,
                side: BorderSide(
                  color: context.textTheme.labelMedium!.color!,
                  width: 1,
                ),
                onChanged: (_) => onTap(),
              ),
              const Gap(4),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colors.inverseSurface,
                  ),
                ),
              ),
            ],
          ).paddingL(12),
        ),
      ),
    );
  }
}
