import 'package:ezy_sneakers/core/colors.dart';
import 'package:flutter/material.dart';

class AppStyle {
  static MaterialColor materialConvervtedColor = MaterialColor(
    kSecondaryColor.value,
    <int, Color>{
      50: kSecondaryColor.withOpacity(0.1),
      100: kSecondaryColor.withOpacity(0.2),
      200: kSecondaryColor.withOpacity(0.3),
      300: kSecondaryColor.withOpacity(0.4),
      400: kSecondaryColor.withOpacity(0.5),
      500: kSecondaryColor.withOpacity(0.6),
      600: kSecondaryColor.withOpacity(0.7),
      700: kSecondaryColor.withOpacity(0.8),
      800: kSecondaryColor.withOpacity(0.9),
      900: kSecondaryColor.withOpacity(1),
    },
  );

  static ThemeData appTheme = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: kPrimaryColor, elevation: 4),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: kSecondaryColor),
    primarySwatch: materialConvervtedColor,
    scaffoldBackgroundColor: kScaffoldBgColor,
    useMaterial3: true,
  );
}
