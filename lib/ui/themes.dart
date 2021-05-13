import 'package:calcunice/constants.dart';
import 'package:flutter/material.dart';

const List<Color> lightGradientColorsList = [
  Colors.white,
  Color.fromRGBO(215, 215, 215, 1)
];
const List<Color> darkGradientColorsList = [
  Color.fromARGB(255, 100, 100, 100),
  Color.fromARGB(255, 37, 37, 37)
];
const baseTextStyleHistoricList = TextStyle(
  fontSize: 20,
  wordSpacing: 8,
);

const baseTextStyleDisplay = TextStyle(
  fontSize: 36,
  fontWeight: FontWeight.bold,
);

const baseKeyboardTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 26,
);

final darkTheme = ThemeData(
  backgroundColor: const Color.fromARGB(255, 37, 37, 37),
  accentColor: Colors.white,
  buttonColor: kDarkNumbersButtonBackgroundColor,
  dialogBackgroundColor: kDarkNumbersButtonBackgroundColor,
  scaffoldBackgroundColor: kDarkNumbersButtonBackgroundColor,
  iconTheme: const IconThemeData(color: kDarkButtonTextColor),
  cardColor: kDarkNumbersButtonBackgroundColor,
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: kDarkButtonTextColor)),
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
    caption: const TextStyle(
      color: kDarkDisplayTextColor,
    ),
    headline5: const TextStyle(
      color: Colors.white,
    ),
  ),
);

final lightTheme = ThemeData(
  backgroundColor: Colors.white,
  accentColor: Colors.black,
  iconTheme: const IconThemeData(color: kLightButtonTextColor),
  buttonColor: kLightNumbersButtonBackgroundColor,
  dialogBackgroundColor: kLightNumbersButtonBackgroundColor,
  scaffoldBackgroundColor: kLightNumbersButtonBackgroundColor,
  cardColor: kLightNumbersButtonBackgroundColor,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(primary: kLightButtonTextColor),
  ),
  textTheme: TextTheme(
    bodyText1: baseTextStyleHistoricList.copyWith(
      color: kDarkHistoricListTextColor,
    ),
    bodyText2: baseTextStyleDisplay.copyWith(
      color: kLightDisplayTextColor,
    ),
    button: baseKeyboardTextStyle.copyWith(
      color: kLightButtonTextColor,
    ),
    caption: const TextStyle(
      color: kLightDisplayTextColor,
    ),
    headline5: const TextStyle(
      color: Color.fromARGB(255, 37, 37, 37),
    ),
  ),
);
