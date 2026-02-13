import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:go_router/go_router.dart';
import 'package:price_app/presentation/notifier/ui_provider.dart';
import 'package:price_app/utils/app_icons.dart';
import 'package:price_app/utils/extention.dart';
import 'package:provider/provider.dart';
import '../../utils/app_colors.dart';

class BottomNavWidget extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavWidget({super.key, required this.navigationShell});

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  @override
  Widget build(BuildContext context) {
    final uINotifier = context.watch<UiNotifier>();
    final routerIndex = widget.navigationShell.currentIndex;
    if (uINotifier.selectedIndex != routerIndex) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        uINotifier.selectedIndex = routerIndex;
      });
    }
    return SafeArea(
      child: Container(
        color: context.scaffoldColor,
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: routerIndex,
          onTap: (index) {
            widget.navigationShell.goBranch(
              index,
              initialLocation: index == routerIndex,
            );
            uINotifier.selectedIndex = index;
            Vibrate.feedback(FeedbackType.medium);
          },
          backgroundColor: Colors.transparent,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: context.colors.primary,
          unselectedItemColor: AppColors.unselectedItem,
          selectedLabelStyle: context.textTheme.displayMedium?.copyWith(
            color: context.colors.primary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: context.textTheme.displayMedium?.copyWith(
            color: AppColors.unselectedItem,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          items: [
            buildNavItem(
              iconPath: AppIcons.home,
              label: 'Home',
              isSelected: uINotifier.selectedIndex == 0,
            ),
            buildNavItem(
              iconPath: AppIcons.saved,
              label: 'Saved',
              isSelected: uINotifier.selectedIndex == 1,
            ),
            buildNavItem(
              iconPath: AppIcons.deals,
              label: 'Deals',
              isSelected: uINotifier.selectedIndex == 2,
            ),
            buildNavItem(
              iconPath: AppIcons.profile,
              label: 'Profile',
              isSelected: uINotifier.selectedIndex == 3,
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem buildNavItem({
    required String iconPath,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        iconPath,
        colorFilter: ColorFilter.mode(
          isSelected ? context.colors.primary : AppColors.unselectedItem,
          BlendMode.srcIn,
        ),
      ).paddingB(6),
      label: label,
    );
  }
}
