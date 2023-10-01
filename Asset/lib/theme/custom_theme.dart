import 'package:flutter/material.dart';

import 'colors.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: CustomColors.textColor,
        scaffoldBackgroundColor: CustomColors.backgroundColor,
        fontFamily: 'Montserrat', //3
        appBarTheme: const AppBarTheme(
          color: CustomColors.backgroundColor,

        ));
  }
}
