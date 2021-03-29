// dependiendo de la posicion que se este renderizando esta clase será responsable de:
//  - si se tiene que dibujar algo o no.
// - si la cantidad de espacios horizontales o verticales que tiene que ocupar el botón (siendo 1x1 la base)
// - el icono a dibujar
// - el color del boton
// - la acción del boton

import 'package:calcunice/models/button_action.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

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
  });

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
    buttonAction: ButtonAction.squareRoot,
  ),
  ButtonModel(
    icon: null,
    text: "7",
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 0,
    positionY: 2,
    buttonAction: ButtonAction.seven,
  ),
  ButtonModel(
    icon: null,
    text: "4",
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 0,
    positionY: 3,
    buttonAction: ButtonAction.four,
  ),
  ButtonModel(
    icon: null,
    text: "1",
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 0,
    positionY: 4,
    buttonAction: ButtonAction.one,
  ),
  ButtonModel(
    icon: null,
    text: ".",
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 0,
    positionY: 5,
    buttonAction: ButtonAction.point,
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
    buttonAction: ButtonAction.two,
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
