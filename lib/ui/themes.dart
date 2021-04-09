import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class Themes {
  static final List<Color> lightGradientColorsList = [
    Colors.white,
    Color.fromRGBO(215, 215, 215, 1)
  ];
  static final List<Color> darkGradientColorsList = [
    Color.fromARGB(255, 100, 100, 100),
    Color.fromARGB(255, 37, 37, 37)
  ];
  static final baseTextStyleHistoricList = TextStyle(
    fontSize: 20.0,
    wordSpacing: 8.0,
  );

  static final baseTextStyleDisplay = TextStyle(
    fontSize: 36.0,
    fontWeight: FontWeight.bold,
  );

  static final darkTheme = ThemeData(
    textTheme: TextTheme(
      bodyText1: baseTextStyleHistoricList.copyWith(
        color: kDarkHistoricListTextColor,
      ),
      bodyText2: baseTextStyleDisplay.copyWith(
        color: kDarkDisplayTextColor,
      ),
    ),
    brightness: Brightness.dark,
  );

  static final lightTheme = ThemeData(
    textTheme: TextTheme(
      bodyText1: baseTextStyleHistoricList.copyWith(
        color: kLightHistoricListTextColor,
      ),
      bodyText2: baseTextStyleDisplay.copyWith(
        color: kLightDisplayTextColor,
      ),
    ),
    brightness: Brightness.light,
  );
}
