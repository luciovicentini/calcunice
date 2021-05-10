import 'package:flutter/material.dart';
import 'package:calcunice/constants.dart';

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
  buttonColor: kDarkNumbersButtonBackgroundColor,
  dialogBackgroundColor: kDarkNumbersButtonBackgroundColor,
  scaffoldBackgroundColor: kDarkNumbersButtonBackgroundColor,
  iconTheme: const IconThemeData(color: kDarkButtonTextColor),
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
  ),
);

final lightTheme = ThemeData(
  backgroundColor: Colors.white,
  iconTheme: const IconThemeData(color: kLightButtonTextColor),
  buttonColor: kLightNumbersButtonBackgroundColor,
  dialogBackgroundColor: kLightNumbersButtonBackgroundColor,
  scaffoldBackgroundColor: kLightNumbersButtonBackgroundColor,
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
  ),
);
