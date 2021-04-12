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

  static final baseKeyboardTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 26.0,
  );

  static final darkTheme = ThemeData(
    buttonColor: kDarkNumbersButtonBackgroundColor,
    textTheme: TextTheme(
      // TextTheme for the list of historic expressions.
      bodyText1: baseTextStyleHistoricList.copyWith(
        color: kDarkHistoricListTextColor,
      ),
      // TextTheme for the main display.
      bodyText2: baseTextStyleDisplay.copyWith(
        color: kDarkDisplayTextColor,
      ),
      button: baseKeyboardTextStyle.copyWith(
        color: kDarkButtonTextColor,
      ),
    ),
  );

  static final lightTheme = ThemeData(
    buttonColor: kLightNumbersButtonBackgroundColor,
    textTheme: TextTheme(
      bodyText1: baseTextStyleHistoricList.copyWith(
        color: kLightHistoricListTextColor,
      ),
      bodyText2: baseTextStyleDisplay.copyWith(
        color: kLightDisplayTextColor,
      ),
      button: baseKeyboardTextStyle.copyWith(
        color: kLightButtonTextColor,
      ),
    ),
  );
}
