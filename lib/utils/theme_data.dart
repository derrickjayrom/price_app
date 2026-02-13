import 'app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

TextStyle textStyle = const TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w600,
  color: AppColors.lMainText,
  fontFamily: 'Manrope',
);

final ThemeData _baseLightTheme = FlexThemeData.light(
  useMaterial3: true,
  fontFamily: 'Manrope',
  colors: FlexSchemeColor(
    primary: AppColors.black,
    secondary: AppColors.lSecondary,
    appBarColor: AppColors.lightBg,
    tertiary: AppColors.lSecondary,
    primaryContainer: AppColors.primary,
    secondaryContainer: AppColors.darkBg,
    errorContainer: AppColors.dTileHeaderDanger,
    tertiaryContainer: AppColors.black,
  ),
);

ThemeData lightTheme = _baseLightTheme.copyWith(
  colorScheme: _baseLightTheme.colorScheme.copyWith(
    outlineVariant: AppColors.black,
    tertiaryFixed: AppColors.white,
    inversePrimary: AppColors.primary,
    scrim: AppColors.lSubText,
    surfaceDim: AppColors.lNavBar,
    surfaceContainer: AppColors.lFilterBorder,
    surfaceContainerHigh: AppColors.lFilterInnermost,
    surfaceContainerHighest: AppColors.lGreen,
    surfaceContainerLow: AppColors.lYellow,
    surfaceContainerLowest: AppColors.lYellowTranslucent,
    primaryFixedDim: AppColors.lFilterBorder,
    tertiaryFixedDim: AppColors.white,
    outline: AppColors.lDividerColor,
  ),
  scaffoldBackgroundColor: AppColors.lightBg,
  //const Color.fromARGB(255, 245, 246, 253),
  appBarTheme: const AppBarTheme(backgroundColor: AppColors.lightBg),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColors.lightBg,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(0)),
    ),
  ),

  textTheme: TextTheme(
    headlineLarge: textStyle.copyWith(fontSize: 24),
    headlineMedium: textStyle.copyWith(fontSize: 20),
    headlineSmall: textStyle.copyWith(fontSize: 16),
    labelSmall: textStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.lSubText,
    ),
    labelMedium: textStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.lSubText,
    ),
    labelLarge: textStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.lSubText,
    ),
    titleSmall: textStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: AppColors.lMainText,
    ),
    titleMedium: textStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.lMainText,
    ),
    titleLarge: textStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.lMainText,
    ),

    bodySmall: textStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.lMainText,
    ),
    bodyMedium: textStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.lMainText,
    ),
    bodyLarge: textStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.lMainText,
    ),
    displayMedium: textStyle.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.lMainText,
    ),
  ),
);

final ThemeData _baseDarkTheme = FlexThemeData.dark(
  useMaterial3: true,
  fontFamily: 'Manrope',
  colors: FlexSchemeColor(
    primary: AppColors.primary,
    secondary: AppColors.dSecondary,
    appBarColor: AppColors.darkBg,
    tertiary: AppColors.dNavBar,
    primaryContainer: AppColors.primary,
    secondaryContainer: AppColors.dPromoProgress,
    errorContainer: AppColors.dTileHeaderDanger,
    tertiaryContainer: AppColors.black,
  ),
);

ThemeData darkTheme = _baseDarkTheme.copyWith(
  colorScheme: _baseDarkTheme.colorScheme.copyWith(
    outlineVariant: AppColors.white,
    tertiaryFixed: AppColors.white,
    inversePrimary: AppColors.dSecondary,
    scrim: AppColors.lSubText,
    surfaceDim: AppColors.dNavBar,
    surface: AppColors.darkBg,
    surfaceContainer: AppColors.dSecondary,
    surfaceContainerHigh: AppColors.dFilterInnermost,
    surfaceContainerHighest: AppColors.dGreen,
    surfaceContainerLow: AppColors.dYellow,
    surfaceContainerLowest: AppColors.dYellowTranslucent,
    primaryFixedDim: AppColors.darkBg,
    tertiaryFixedDim: AppColors.black,
    outline: AppColors.dDividerColor,
  ),

  scaffoldBackgroundColor: AppColors.darkBg,
  appBarTheme: const AppBarTheme(backgroundColor: AppColors.darkBg),
  highlightColor: AppColors.white,
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColors.darkBg,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(0)),
    ),
  ),
  textTheme: TextTheme(
    headlineLarge: textStyle.copyWith(fontSize: 24, color: AppColors.dMainText),
    headlineMedium: textStyle.copyWith(
      fontSize: 20,
      color: AppColors.dMainText,
    ),
    headlineSmall: textStyle.copyWith(fontSize: 16, color: AppColors.dMainText),
    labelSmall: textStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.dSubText,
    ),
    labelMedium: textStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.dSubText,
    ),
    labelLarge: textStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.dSubText,
    ),
    titleSmall: textStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: AppColors.dMainText,
    ),
    titleMedium: textStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.dMainText,
    ),
    titleLarge: textStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.dMainText,
    ),
    bodySmall: textStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.dMainText,
    ),
    bodyMedium: textStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.dMainText,
    ),
    bodyLarge: textStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.dMainText,
    ),
    displayMedium: textStyle.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.dMainText,
    ),
  ),
);

// ThemeData(
//   brightness: Brightness.light,
//   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//   useMaterial3: true,
// ),
