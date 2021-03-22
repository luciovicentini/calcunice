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
  var action;

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

  static ButtonModel deleteAll(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: Icons.arrow_upward_rounded,
        backgroundColor: kLightArrowUpButtonBackground,
      );

  static ButtonModel delete(int positionX, int positionY) => ButtonModel(
        icon: 'C',
        backgroundColor: kLightClearButtonBackground,
        positionX: positionX,
        positionY: positionY,
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
      );

  static ButtonModel subtract(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '-',
        backgroundColor: kBasicOperationBackgroundLightColor,
      );

  static ButtonModel multiply(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: 'x',
        backgroundColor: kBasicOperationBackgroundLightColor,
      );

  static ButtonModel division(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '/',
        backgroundColor: kBasicOperationBackgroundLightColor,
      );

  static ButtonModel openParenthesis(int positionX, int positionY) =>
      ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '(',
        iconColor: Colors.white,
        backgroundColor: kLightPurpleBackbround,
      );

  static ButtonModel closeParenthesis(int positionX, int positionY) =>
      ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: ')',
        iconColor: Colors.white,
        backgroundColor: kLightPurpleBackbround,
      );

  static ButtonModel squareRoot(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '\u221a',
        iconColor: Colors.white,
        backgroundColor: kLightPurpleBackbround,
      );

  static ButtonModel percentage(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '%',
        iconColor: Colors.white,
        backgroundColor: kLightPurpleBackbround,
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
        iconColor: Colors.white,
        backgroundColor: kLightPurpleBackbround,
      );

  static ButtonModel one(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '1',
        backgroundColor: kNumberBackgroundColor,
      );

  static ButtonModel two(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '2',
        backgroundColor: kNumberBackgroundColor,
      );

  static ButtonModel three(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '3',
        backgroundColor: kNumberBackgroundColor,
      );

  static ButtonModel four(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '4',
        backgroundColor: kNumberBackgroundColor,
      );

  static ButtonModel five(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '5',
        backgroundColor: kNumberBackgroundColor,
      );

  static ButtonModel six(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '6',
        backgroundColor: kNumberBackgroundColor,
      );

  static ButtonModel seven(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '7',
        backgroundColor: kNumberBackgroundColor,
      );

  static ButtonModel eight(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '8',
        backgroundColor: kNumberBackgroundColor,
      );

  static ButtonModel nine(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '9',
        backgroundColor: kNumberBackgroundColor,
      );

  static ButtonModel period(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '.',
        backgroundColor: kNumberBackgroundColor,
      );

  static ButtonModel backspace(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: Icons.backspace,
        backgroundColor: kNumberBackgroundColor,
      );

  @override
  String toString() {
    return 'ButtonModel{stepsX: $stepsX, stepsY: $stepsY, positionX: $positionX, positionY: $positionY, icon: $icon, iconColor: $iconColor, backgroundColor: $backgroundColor, action: $action}';
  }

  static final listButtons = <ButtonModel>[
    ButtonModel.delete(0, 0),
    ButtonModel.openParenthesis(0, 1),
    ButtonModel.closeParenthesis(0, 2),
    ButtonModel.multiply(0, 3),
    ButtonModel.squareRoot(1, 0),
    ButtonModel.percentage(1, 1),
    ButtonModel.plusMinus(1, 2),
    ButtonModel.division(1, 3),
    ButtonModel.seven(2, 0),
    ButtonModel.eight(2, 1),
    ButtonModel.nine(2, 2),
    ButtonModel.subtract(2, 3),
    ButtonModel.four(3, 0),
    ButtonModel.five(3, 1),
    ButtonModel.six(3, 2),
    ButtonModel.add(3, 3),
    ButtonModel.one(4, 0),
    ButtonModel.two(4, 1),
    ButtonModel.three(4, 2),
    ButtonModel.equals(4, 3),
    ButtonModel.period(5, 0),
    ButtonModel.zero(5, 1),
    ButtonModel.backspace(5, 2),
    ButtonModel.none(5, 3)
  ];
}
