// dependiendo de la posicion que se este renderizando esta clase será responsable de:
//  - si se tiene que dibujar algo o no.
// - si la cantidad de espacios horizontales o verticales que tiene que ocupar el botón (siendo 1x1 la base)
// - el icono a dibujar
// - el color del boton
// - la acción del boton

import 'package:flutter/material.dart';

import '../constants.dart';

class ButtonModel {
  int stepsX;
  int stepsY;
  int positionX;
  int positionY;
  Object? icon;
  Color? iconColor;
  Color? backgroundColor;
  String Function(String)? action;

  ButtonModel(
      {this.stepsX = 1,
      this.stepsY = 1,
      this.icon,
      this.iconColor,
      this.backgroundColor,
      this.positionX = 0,
      this.positionY = 0,
      this.action});

  static ButtonModel none(int positionX, int positionY) {
    return ButtonModel(
      positionX: positionX,
      positionY: positionY,
    );
  }

  static ButtonModel delete(int positionX, int positionY) => ButtonModel(
        icon: 'C',
        backgroundColor: kLightClearButtonBackground,
        positionX: positionX,
        positionY: positionY,
        action: (displayString) => '',
      );

  static ButtonModel equals(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        stepsX: 1,
        stepsY: 2,
        icon: '=',
        iconColor: Colors.white,
        backgroundColor: kBasicOperationBackgroundColor,
      );

  static ButtonModel add(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '+',
        backgroundColor: kBasicOperationBackgroundLightColor,
        action: (displayString) => displayString + ' + ',
      );

  static ButtonModel subtract(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '-',
        backgroundColor: kBasicOperationBackgroundLightColor,
        action: (displayString) => displayString + ' - ',
      );

  static ButtonModel multiply(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: 'x',
        backgroundColor: kBasicOperationBackgroundLightColor,
        action: (displayString) => displayString + ' x ',
      );

  static ButtonModel division(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '/',
        backgroundColor: kBasicOperationBackgroundLightColor,
        action: (displayString) => displayString + ' / ',
      );

  static ButtonModel openParenthesis(int positionX, int positionY) =>
      ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '(',
        iconColor: Colors.white,
        backgroundColor: kLightPurpleBackbround,
        action: (displayString) => displayString + '(',
      );

  static ButtonModel closeParenthesis(int positionX, int positionY) =>
      ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: ')',
        iconColor: Colors.white,
        backgroundColor: kLightPurpleBackbround,
        action: (displayString) => displayString + ')',
      );

  static ButtonModel squareRoot(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '\u221a',
        iconColor: Colors.white,
        backgroundColor: kLightPurpleBackbround,
        action: (displayString) => displayString + '√(',
      );

  static ButtonModel percentage(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '%',
        iconColor: Colors.white,
        backgroundColor: kLightPurpleBackbround,
        action: (displayString) => displayString + '% of',
      );

  static ButtonModel plusMinus(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '+/-',
        iconColor: Colors.white,
        backgroundColor: kLightPurpleBackbround,
      );

  static ButtonModel zero(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '0',
        backgroundColor: kNumberBackgroundColor,
        action: (displayString) => displayString + '0',
      );

  static ButtonModel one(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '1',
        backgroundColor: kNumberBackgroundColor,
        action: (displayString) => displayString + '1',
      );

  static ButtonModel two(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '2',
        backgroundColor: kNumberBackgroundColor,
        action: (displayString) => displayString + '2',
      );

  static ButtonModel three(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '3',
        backgroundColor: kNumberBackgroundColor,
        action: (displayString) => displayString + '3',
      );

  static ButtonModel four(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '4',
        backgroundColor: kNumberBackgroundColor,
        action: (displayString) => displayString + '4',
      );

  static ButtonModel five(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '5',
        backgroundColor: kNumberBackgroundColor,
        action: (displayString) => displayString + '5',
      );

  static ButtonModel six(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '6',
        backgroundColor: kNumberBackgroundColor,
        action: (displayString) => displayString + '6',
      );

  static ButtonModel seven(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '7',
        backgroundColor: kNumberBackgroundColor,
        action: (displayString) => displayString + '7',
      );

  static ButtonModel eight(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '8',
        backgroundColor: kNumberBackgroundColor,
        action: (displayString) => displayString + '8',
      );

  static ButtonModel nine(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '9',
        backgroundColor: kNumberBackgroundColor,
        action: (displayString) => displayString + '9',
      );

  static ButtonModel period(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '.',
        backgroundColor: kNumberBackgroundColor,
        action: (displayString) => displayString + '.',
      );

  static ButtonModel backspace(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: Icons.backspace,
        backgroundColor: kNumberBackgroundColor,
        action: (displayString) =>
            displayString.substring(0, displayString.length - 1),
      );

  @override
  String toString() {
    return 'ButtonModel{stepsX: $stepsX, stepsY: $stepsY, positionX: $positionX, positionY: $positionY, icon: $icon, iconColor: $iconColor, backgroundColor: $backgroundColor, action: $action}';
  }

  static final listButtons = <ButtonModel>[
    ButtonModel.delete(0, 0),
    ButtonModel.squareRoot(0, 1),
    ButtonModel.seven(0, 2),
    ButtonModel.four(0, 3),
    ButtonModel.one(0, 4),
    ButtonModel.period(0, 5),
    ButtonModel.openParenthesis(1, 0),
    ButtonModel.percentage(1, 1),
    ButtonModel.eight(1, 2),
    ButtonModel.five(1, 3),
    ButtonModel.two(1, 4),
    ButtonModel.zero(1, 5),
    ButtonModel.closeParenthesis(2, 0),
    ButtonModel.plusMinus(2, 1),
    ButtonModel.nine(2, 2),
    ButtonModel.six(2, 3),
    ButtonModel.three(2, 4),
    ButtonModel.backspace(2, 5),
    ButtonModel.multiply(3, 0),
    ButtonModel.division(3, 1),
    ButtonModel.subtract(3, 2),
    ButtonModel.add(3, 3),
    ButtonModel.equals(3, 4),
  ];
}
