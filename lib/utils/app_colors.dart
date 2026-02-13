import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static Color transparent = Colors.transparent;

  static const Color primary = Color(0xFF0DDE65);

  // Dark Theme Colors
  static const Color darkBg = Color(0xFF0F1513);
  static const Color dSecondary = Color(0xFF19201E);
  static const Color dYellow = Color(0xFFFFCC1B);
  static const Color dYellowTranslucent = Color(0x1AFFCC1B);
  static const Color dGreen = Color(0xFF0DDE65);
  static const Color dMainText = Color(0xFFFEFEFE);
  static const Color dSubText = Color(0xFF808080);
  static const Color dNavBar = Color(0xFF0F1513);
  static const Color dPromoProgress = Color(0xFF00D26A);
  static const Color dTileHeaderDanger = Color(0xFFAD2D29);
  static const Color dFilterInnermost = Color(0xFF171818);
  static const Color dFilterBorder = Color(0xFF373737);
  static const Color dDividerColor = Color(0xFF2A302E);

  // Light Theme Colors
  static const Color lightBg = Color(0xFFFFFFFF);
  static const Color lSecondary = Color(0xFFF5F5F5);
  static const Color lYellow = Color(0xFFFFCC1B);
  static const Color lYellowTranslucent = Color(0x1AFFCC1B);
  static const Color lGreen = Color(0xFF009A2F);
  static const Color lMainText = Color(0xFF000000);
  static const Color lSubText = Color(0xFF808080);
  static const Color lNavBar = Color(0xFFFFFFFF);
  static const Color lPromoProgress = Color(0xFFFFCC1B);
  static const Color lTileHeaderDanger = Color(0xFFAD2D29);
  static const Color lFilterInnermost = Color(0xFFE8E7E7);
  static const Color lFilterBorder = Color(0xFFC8C8C8);
  static const Color lDividerColor = Color(0xFF0F1110);

  static const Color black = Color(0xFF000000);
  static const Color bgBlack = Color(0xCC000000);
  static const Color red = Color(0xFFff0000);
  static const Color white = Color(0xFFFFFFFF);

  static const Color blackText = Color(0xFF111111);
  static const Color darkestGrey = Color.fromARGB(255, 50, 50, 50);
  static const Color darkerGrey = Color.fromARGB(255, 75, 75, 75);
  static const Color grey = Color(0xFF7F7F7F);
  static const Color successColor = Color(0xFF0DDE65);
  static const Color borderColor = Color(0xFFEBEBF0);
  static Color borderColor2 = AppColors.grey.withValues(alpha: .2);
  static const Color iconBtnBg = Color(0xFF1A1D1C);
  static const Color unselectedItem = Color(0xFF7E7E7E);
  static const Color blue = Color(0xFF1D4ED8);
}
