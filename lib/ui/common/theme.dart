import 'package:flutter/material.dart';

import 'styles.dart';

ThemeData kAppTheme = ThemeData(
  primaryColor: ColorPallete.primaryColor,
  accentColor: ColorPallete.secondaryColor,
  textTheme: kTextTheme,
  appBarTheme: AppBarTheme(
    backgroundColor: ColorPallete.backgroundColor,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    elevation: 0,
  ),
  primaryTextTheme: kTextTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      primary: ColorPallete.primaryColor,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      primary: ColorPallete.primaryColor,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: 0,
      primary: ColorPallete.primaryColor,
    ),
  ),
);
