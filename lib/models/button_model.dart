// dependiendo de la posicion que se este renderizando esta clase será responsable de:
//  - si se tiene que dibujar algo o no.
// - si la cantidad de espacios horizontales o verticales que tiene que ocupar el botón (siendo 1x1 la base)
// - el icono a dibujar
// - el color del boton
// - la acción del boton

import 'package:flutter/material.dart';

import '../constants.dart';

class ButtonModel {
  int stepsX = 1;
  int stepsY = 1;
  int positionX = 0;
  int positionY = 0;
  Object icon;
  Color iconColor;
  Color backgroundColor;
  var action;

  ButtonModel(
      {this.stepsX,
      this.stepsY,
      this.icon,
      this.iconColor,
      this.backgroundColor,
      this.positionX,
      this.positionY,
      this.action});

  ButtonModel.none(String position) {
    this.stepsX = 0;
    this.stepsY = 0;
    _setPositionFromString(position);
  }

  ButtonModel.deleteAll(String position) {
    _setPositionFromString(position);
    icon = Icons.arrow_upward_rounded;
    backgroundColor = kLightArrowUpButtonBackground;
  }

  ButtonModel.delete(String position) {
    _setPositionFromString(position);
    icon = 'C';
    backgroundColor = kLightClearButtonBackground;
  }

  ButtonModel.equals(String position) {
    _setPositionFromString(position);
    stepsX = 1;
    stepsY = 2;
    icon = '=';
    iconColor = Colors.white;
    backgroundColor = kBasicOperationBackgroundColor;
  }

  ButtonModel.add(String position) {
    _setPositionFromString(position);
    icon = '+';
    backgroundColor = kBasicOperationBackgroundLightColor;
  }

  ButtonModel.subtract(String position) {
    _setPositionFromString(position);
    icon = '-';
    backgroundColor = kBasicOperationBackgroundLightColor;
  }

  ButtonModel.multiply(String position) {
    _setPositionFromString(position);
    icon = 'x';
    backgroundColor = kBasicOperationBackgroundLightColor;
  }

  ButtonModel.division(String position) {
    _setPositionFromString(position);
    icon = '/';
    backgroundColor = kBasicOperationBackgroundLightColor;
  }

  ButtonModel.openParenthesis(String position) {
    _setPositionFromString(position);
    icon = '(';
    iconColor = Colors.white;
    backgroundColor = kLightPurpleBackbround;
  }

  ButtonModel.closeParenthesis(String position) {
    _setPositionFromString(position);
    icon = ')';
    iconColor = Colors.white;
    backgroundColor = kLightPurpleBackbround;
  }

  ButtonModel.squareRoot(String position) {
    _setPositionFromString(position);
    icon = '\u221a';
    iconColor = Colors.white;
    backgroundColor = kLightPurpleBackbround;
  }

  ButtonModel.percentage(String position) {
    _setPositionFromString(position);
    icon = '%';
    iconColor = Colors.white;
    backgroundColor = kLightPurpleBackbround;
  }

  ButtonModel.plusMinus(String position) {
    _setPositionFromString(position);
    icon = '+/-';
    iconColor = Colors.white;
    backgroundColor = kLightPurpleBackbround;
  }

  ButtonModel.zero(String position) {
    _setPositionFromString(position);
    icon = '0';
    backgroundColor = kNumberBackgroundColor;
  }

  ButtonModel.one(String position) {
    _setPositionFromString(position);
    icon = '1';
    backgroundColor = kNumberBackgroundColor;
  }

  ButtonModel.two(String position) {
    _setPositionFromString(position);
    icon = '2';
    backgroundColor = kNumberBackgroundColor;
  }

  ButtonModel.three(String position) {
    _setPositionFromString(position);
    icon = '3';
    backgroundColor = kNumberBackgroundColor;
  }

  ButtonModel.four(String position) {
    _setPositionFromString(position);
    icon = '4';
    backgroundColor = kNumberBackgroundColor;
  }

  ButtonModel.five(String position) {
    _setPositionFromString(position);
    icon = '5';
    backgroundColor = kNumberBackgroundColor;
  }

  ButtonModel.six(String position) {
    _setPositionFromString(position);
    icon = '6';
    backgroundColor = kNumberBackgroundColor;
  }

  ButtonModel.seven(String position) {
    _setPositionFromString(position);
    icon = '7';
    backgroundColor = kNumberBackgroundColor;
  }

  ButtonModel.eight(String position) {
    _setPositionFromString(position);
    icon = '8';
    backgroundColor = kNumberBackgroundColor;
  }

  ButtonModel.nine(String position) {
    _setPositionFromString(position);
    icon = '9';
    backgroundColor = kNumberBackgroundColor;
  }

  ButtonModel.period(String position) {
    _setPositionFromString(position);
    icon = '.';
    backgroundColor = kNumberBackgroundColor;
  }

  ButtonModel.backspace(String position) {
    _setPositionFromString(position);
    icon = Icons.backspace;
    backgroundColor = kNumberBackgroundColor;
  }

  @override
  String toString() {
    return 'ButtonModel{stepsX: $stepsX, stepsY: $stepsY, positionX: $positionX, positionY: $positionY, icon: $icon, iconColor: $iconColor, backgroundColor: $backgroundColor, action: $action}';
  }

  void _setPositionFromString(String position) {
    assert(position.contains('-'));
    final positionList = position.split('-');
    assert(positionList.length == 2);
    this.positionY = int.tryParse(positionList.first);
    this.positionX = int.tryParse(positionList.last);
  }

  static final listButtons = <ButtonModel>[
    ButtonModel.delete('0-0'),
    ButtonModel.openParenthesis('0-1'),
    ButtonModel.closeParenthesis('0-2'),
    ButtonModel.multiply('0-3'),
    ButtonModel.squareRoot('1-0'),
    ButtonModel.percentage('1-1'),
    ButtonModel.plusMinus('1-2'),
    ButtonModel.division('1-3'),
    ButtonModel.seven('2-0'),
    ButtonModel.eight('2-1'),
    ButtonModel.nine('2-2'),
    ButtonModel.subtract('2-3'),
    ButtonModel.six('3-0'),
    ButtonModel.five('3-1'),
    ButtonModel.four('3-2'),
    ButtonModel.add('3-3'),
    ButtonModel.three('4-0'),
    ButtonModel.two('4-1'),
    ButtonModel.one('4-2'),
    ButtonModel.equals('4-3'),
    ButtonModel.period('5-0'),
    ButtonModel.zero('5-1'),
    ButtonModel.backspace('5-2'),
    ButtonModel.none('5-3')
  ];
}
