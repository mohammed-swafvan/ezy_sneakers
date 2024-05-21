import 'package:ezy_sneakers/core/colors.dart';
import 'package:ezy_sneakers/core/constants.dart';
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
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: kPrimaryColor,
      elevation: 6,
      shadowColor: kLightGrey.withOpacity(0.3),
      centerTitle: false,
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
    ),
    shadowColor: kLightGrey,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(kPrimaryColor),
        backgroundColor: WidgetStateProperty.all<Color>(kSecondaryColor),
        elevation: WidgetStateProperty.all<double>(4.0),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: kBorderRadius12,
          ),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsets>(kEdgeInsetsVert10),
        foregroundColor: WidgetStateProperty.all<Color>(kPrimaryColor),
        backgroundColor: WidgetStateProperty.all<Color>(kSecondaryColor),
        elevation: WidgetStateProperty.all<double>(4.0),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: kBorderRadius10,
          ),
        ),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: kSecondaryColor),
    primarySwatch: materialConvervtedColor,
    scaffoldBackgroundColor: kScaffoldBgColor,
    useMaterial3: false,
  );
}
