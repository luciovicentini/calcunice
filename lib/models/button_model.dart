// dependiendo de la posicion que se este renderizando esta clase será responsable de:
//  - si se tiene que dibujar algo o no.
// - si la cantidad de espacios horizontales o verticales que tiene que ocupar el botón (siendo 1x1 la base)
// - el icono a dibujar
// - el color del boton
// - la acción del boton

import 'package:calcunice/models/button_action.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
/* TODO dejar esta clase para definir la UI y armar otra clase para modelar
 botones dentro de CalculatorModel y generar Ids unicos desde el modelo de
  botones(UI al modelo de botones(BL) */

class ButtonModel {
  final int stepsX;
  final int stepsY;
  final int positionX;
  final int positionY;
  final IconData? icon;
  final String? text;
  final Color childColor;
  final Color backgroundColor;
  final ButtonAction buttonAction;
  /* bool isEqualButton;
  String Function(String)? displayAction;
  String Function(String)? expressionAction; */

  const ButtonModel({
    this.stepsX = 1,
    this.stepsY = 1,
    required this.icon,
    required this.text,
    required this.childColor,
    required this.backgroundColor,
    required this.positionX,
    required this.positionY,
    required this.buttonAction,
    /* this.isEqualButton = false,
      this.displayAction,
      this.expressionAction */
  });

  /*
  static ButtonModel equals(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        stepsX: 1,
        stepsY: 2,
        icon: '=',
        isEqualButton: true,
        iconColor: Colors.white,
        backgroundColor: kBasicOperationBackgroundColor,
      );

  static ButtonModel add(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '+',
        backgroundColor: kBasicOperationBackgroundLightColor,
        displayAction: (displayString) => displayString + ' + ',
        expressionAction: (expression) => expression + ' + ',
      );

  static ButtonModel subtract(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '-',
        backgroundColor: kBasicOperationBackgroundLightColor,
        displayAction: (displayString) => displayString + ' - ',
        expressionAction: (expression) => expression + ' - ',
      );

  static ButtonModel multiply(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: 'x',
        backgroundColor: kBasicOperationBackgroundLightColor,
        displayAction: (displayString) => displayString + ' x ',
        expressionAction: (expression) => expression + ' x ',
      );

  static ButtonModel division(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '/',
        backgroundColor: kBasicOperationBackgroundLightColor,
        displayAction: (displayString) => displayString + ' ÷ ',
        expressionAction: (expression) => expression + ' / ',
      );

  static ButtonModel openParenthesis(int positionX, int positionY) =>
      ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '(',
        iconColor: Colors.white,
        backgroundColor: kLightPurpleBackbround,
        displayAction: (displayString) => displayString + '(',
        expressionAction: (expression) => expression + '(',
      );

  static ButtonModel closeParenthesis(int positionX, int positionY) =>
      ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: ')',
        iconColor: Colors.white,
        backgroundColor: kLightPurpleBackbround,
        displayAction: (displayString) => displayString + ')',
        expressionAction: (expression) => expression + ')',
      );

  static ButtonModel percentage(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '%',
        iconColor: Colors.white,
        backgroundColor: kLightPurpleBackbround,
        displayAction: (displayString) => displayString + '% of ',
        expressionAction: (expression) => expression + '%',
      );

  static ButtonModel plusMinus(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '+/-',
        iconColor: Colors.white,
        backgroundColor: kLightPurpleBackbround,
        // TODO implmement displayaction y expressionAction
      );

  static ButtonModel zero(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '0',
        backgroundColor: kNumberBackgroundColor,
        displayAction: (displayString) => displayString + '0',
        expressionAction: (expression) => expression + '0',
      );

  static ButtonModel one(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '1',
        backgroundColor: kNumberBackgroundColor,
        displayAction: (displayString) => displayString + '1',
        expressionAction: (expression) => expression + '1',
      );

  static ButtonModel two(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '2',
        backgroundColor: kNumberBackgroundColor,
        displayAction: (displayString) => displayString + '2',
        expressionAction: (expression) => expression + '2',
      );

  static ButtonModel three(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '3',
        backgroundColor: kNumberBackgroundColor,
        displayAction: (displayString) => displayString + '3',
        expressionAction: (expression) => expression + '3',
      );

  static ButtonModel four(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '4',
        backgroundColor: kNumberBackgroundColor,
        displayAction: (displayString) => displayString + '4',
        expressionAction: (expression) => expression + '4',
      );

  static ButtonModel five(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '5',
        backgroundColor: kNumberBackgroundColor,
        displayAction: (displayString) => displayString + '5',
        expressionAction: (expression) => expression + '5',
      );

  static ButtonModel six(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '6',
        backgroundColor: kNumberBackgroundColor,
        displayAction: (displayString) => displayString + '6',
        expressionAction: (expression) => expression + '6',
      );

  static ButtonModel seven(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '7',
        backgroundColor: kNumberBackgroundColor,
        displayAction: (displayString) => displayString + '7',
        expressionAction: (expression) => expression + '7',
      );

  static ButtonModel eight(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '8',
        backgroundColor: kNumberBackgroundColor,
        displayAction: (displayString) => displayString + '8',
        expressionAction: (expression) => expression + '8',
      );

  static ButtonModel nine(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '9',
        backgroundColor: kNumberBackgroundColor,
        displayAction: (displayString) => displayString + '9',
        expressionAction: (expression) => expression + '9',
      );

  static ButtonModel period(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: '.',
        backgroundColor: kNumberBackgroundColor,
        displayAction: (displayString) => displayString + '.',
        expressionAction: (expression) => expression + '.',
      );

  static ButtonModel backspace(int positionX, int positionY) => ButtonModel(
        positionX: positionX,
        positionY: positionY,
        icon: Icons.backspace,
        backgroundColor: kNumberBackgroundColor,
        displayAction: (displayString) =>
            displayString.substring(0, displayString.length - 1),
        expressionAction: (expression) =>
            expression.substring(0, expression.length - 1),
      ); */

  @override
  String toString() {
    return 'ButtonModel{stepsX: $stepsX, stepsY: $stepsY, positionX: $positionX, positionY: $positionY, icon: $icon, iconColor: $childColor, backgroundColor: $backgroundColor, action: $buttonAction}';
  }
}

const listButtons = <ButtonModel>[
  ButtonModel(
    icon: null,
    text: "C",
    childColor: kLightResultScreenTextColor,
    backgroundColor: kLightClearButtonBackground,
    positionX: 0,
    positionY: 0,
    buttonAction: ButtonAction.clearScreen,
  ),
  ButtonModel(
    icon: null,
    text: "\u221a",
    childColor: kNumberBackgroundColor,
    backgroundColor: kLightPurpleBackbround,
    positionX: 0,
    positionY: 1,
    buttonAction: ButtonAction.clearScreen,
  ),
  ButtonModel(
    icon: null,
    text: "7",
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 0,
    positionY: 2,
    buttonAction: ButtonAction.clearScreen,
  ),
  ButtonModel(
    icon: null,
    text: "4",
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 0,
    positionY: 3,
    buttonAction: ButtonAction.clearScreen,
  ),
  ButtonModel(
    icon: null,
    text: "1",
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 0,
    positionY: 4,
    buttonAction: ButtonAction.clearScreen,
  ),
  ButtonModel(
    icon: null,
    text: ".",
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 0,
    positionY: 5,
    buttonAction: ButtonAction.clearScreen,
  ),
  ButtonModel(
    icon: null,
    text: "(",
    childColor: kNumberBackgroundColor,
    backgroundColor: kLightPurpleBackbround,
    positionX: 1,
    positionY: 0,
    buttonAction: ButtonAction.openParenthesis,
  ),
  ButtonModel(
    icon: null,
    text: "%",
    childColor: kNumberBackgroundColor,
    backgroundColor: kLightPurpleBackbround,
    positionX: 1,
    positionY: 1,
    buttonAction: ButtonAction.percentage,
  ),
  ButtonModel(
    icon: null,
    text: "8",
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 1,
    positionY: 2,
    buttonAction: ButtonAction.eight,
  ),
  ButtonModel(
    icon: null,
    text: "5",
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 1,
    positionY: 3,
    buttonAction: ButtonAction.five,
  ),
  ButtonModel(
    icon: null,
    text: "2",
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 1,
    positionY: 4,
    buttonAction: ButtonAction.five,
  ),
  ButtonModel(
    icon: null,
    text: "0",
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 1,
    positionY: 5,
    buttonAction: ButtonAction.zero,
  ),
  ButtonModel(
    icon: null,
    text: ")",
    childColor: kNumberBackgroundColor,
    backgroundColor: kLightPurpleBackbround,
    positionX: 2,
    positionY: 0,
    buttonAction: ButtonAction.closeParenthesis,
  ),
  ButtonModel(
    icon: null,
    text: "+ -",
    childColor: kNumberBackgroundColor,
    backgroundColor: kLightPurpleBackbround,
    positionX: 2,
    positionY: 1,
    buttonAction: ButtonAction.plusMinusToggle,
  ),
  ButtonModel(
    icon: null,
    text: "9",
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 2,
    positionY: 2,
    buttonAction: ButtonAction.nine,
  ),
  ButtonModel(
    icon: null,
    text: "6",
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 2,
    positionY: 3,
    buttonAction: ButtonAction.six,
  ),
  ButtonModel(
    icon: null,
    text: "3",
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 2,
    positionY: 4,
    buttonAction: ButtonAction.three,
  ),
  ButtonModel(
    icon: Icons.backspace,
    text: null,
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 2,
    positionY: 5,
    buttonAction: ButtonAction.backspace,
  ),
  ButtonModel(
    icon: null,
    text: 'x',
    childColor: kLightResultScreenTextColor,
    backgroundColor: kBasicOperationBackgroundLightColor,
    positionX: 3,
    positionY: 0,
    buttonAction: ButtonAction.multiplication,
  ),
  ButtonModel(
    icon: null,
    text: '/',
    childColor: kLightResultScreenTextColor,
    backgroundColor: kBasicOperationBackgroundLightColor,
    positionX: 3,
    positionY: 1,
    buttonAction: ButtonAction.division,
  ),
  ButtonModel(
    icon: null,
    text: '-',
    childColor: kLightResultScreenTextColor,
    backgroundColor: kBasicOperationBackgroundLightColor,
    positionX: 3,
    positionY: 2,
    buttonAction: ButtonAction.substraction,
  ),
  ButtonModel(
    icon: null,
    text: '+',
    childColor: kLightResultScreenTextColor,
    backgroundColor: kBasicOperationBackgroundLightColor,
    positionX: 3,
    positionY: 3,
    buttonAction: ButtonAction.addition,
  ),
  ButtonModel(
    stepsY: 2,
    icon: null,
    text: '=',
    childColor: kNumberBackgroundColor,
    backgroundColor: kBasicOperationBackgroundColor,
    positionX: 3,
    positionY: 4,
    buttonAction: ButtonAction.equals,
  ),
];
