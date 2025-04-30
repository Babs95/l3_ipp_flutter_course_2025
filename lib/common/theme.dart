import 'package:flutter/material.dart';
import 'package:l3_ipp_app/common/constants_color.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light(useMaterial3: true).copyWith(
    colorScheme: ColorScheme(
        primary: kPrimaryColor,
        onPrimary: Colors.black,
        secondary: kSecondaryColor,
        onSecondary: Colors.white,
        brightness: Brightness.light,
        error: Colors.red,
        onError: Colors.red,
        surface: kWhiteColor,
        onSurface: kDeepDarkColor
    ),
    scaffoldBackgroundColor: kSecondaryColor,
    appBarTheme: appBarTheme
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark(useMaterial3: true).copyWith(
      colorScheme: ColorScheme(
          primary: kPrimaryColor,
          onPrimary: Colors.black,
          secondary: kSecondaryColor,
          onSecondary: Colors.white,
          brightness: Brightness.dark,
          error: Colors.red,
          onError: Colors.red,
          surface: Colors.white,
          onSurface: Colors.white
      ),
      scaffoldBackgroundColor: kDeepDarkColor,
      appBarTheme: appBarTheme.copyWith(
        iconTheme: IconThemeData(color: kWhiteColor)
      )
  );
}

const appBarTheme = AppBarTheme(
  centerTitle: false,
  color: kPrimaryColor,
  iconTheme: IconThemeData(color: kDarkColor)
);