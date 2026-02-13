import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:price_app/presentation/notifier/ui_provider.dart';
import 'package:price_app/utils/app_colors.dart';
import 'package:price_app/utils/extention.dart';
import 'package:price_app/widget/bottom_nav_widget.dart';
import 'package:provider/provider.dart';

class IndexScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const IndexScreen({super.key, required this.navigationShell});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  late UiNotifier uiNotifier;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    uiNotifier = context.watch<UiNotifier>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: context.isDarkMode ? AppColors.darkBg : null,
      body: SafeArea(
        top: false,
        left: false,
        bottom: true,
        child: Stack(children: [widget.navigationShell]),
      ),
      bottomNavigationBar: BottomNavWidget(
        navigationShell: widget.navigationShell,
      ),
    );
  }
}
