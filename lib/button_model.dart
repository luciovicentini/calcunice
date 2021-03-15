// dependiendo de la posicion que se este renderizando esta clase será responsable de:
//  - si se tiene que dibujar algo o no.
// - si la cantidad de espacios horizontales o verticales que tiene que ocupar el botón (siendo 1x1 la base)
// - el icono a dibujar
// - el color del boton
// - la acción del boton

import 'package:flutter/material.dart';

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
    icon = Icons.arrow_upward_rounded;
    backgroundColor = Colors.grey;
    _setPositionFromString(position);
  }

  ButtonModel.delete(String position) {
    _setPositionFromString(position);
    icon = 'C';
    backgroundColor = Colors.purpleAccent;
  }

  ButtonModel.equals(String position) {
    _setPositionFromString(position);
    stepsX = 1;
    stepsY = 2;
    icon = '=';
    iconColor = Colors.white;
    backgroundColor = Colors.orange;
  }

  ButtonModel.add(String position) {
    _setPositionFromString(position);
    icon = '+';
    backgroundColor = Colors.orangeAccent;
  }

  ButtonModel.subtract(String position) {
    _setPositionFromString(position);
    icon = '-';
    backgroundColor = Colors.orangeAccent;
  }

  ButtonModel.multiply(String position) {
    _setPositionFromString(position);
    icon = 'x';
    backgroundColor = Colors.orangeAccent;
  }

  ButtonModel.division(String position) {
    _setPositionFromString(position);
    icon = '/';
    backgroundColor = Colors.orangeAccent;
  }

  ButtonModel.openParenthesis(String position) {
    _setPositionFromString(position);
    icon = '(';
    iconColor = Colors.white;
    backgroundColor = Colors.purple[900];
  }
  ButtonModel.closeParenthesis(String position) {
    _setPositionFromString(position);
    icon = ')';
    iconColor = Colors.white;
    backgroundColor = Colors.purple[900];
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
    ButtonModel.none('0-0'),
    ButtonModel.none('0-1'),
    ButtonModel.none('0-2'),
    ButtonModel.deleteAll('0-3'),
    ButtonModel.delete('1-0'),
    ButtonModel.openParenthesis('1-1'),
    ButtonModel.closeParenthesis('1-2'),
    ButtonModel.multiply('1-3'),
    ButtonModel.deleteAll('2-0'),
    ButtonModel.deleteAll('2-1'),
    ButtonModel.deleteAll('2-2'),
    ButtonModel.division('2-3'),
    ButtonModel.deleteAll('3-0'),
    ButtonModel.deleteAll('3-1'),
    ButtonModel.deleteAll('3-2'),
    ButtonModel.subtract('3-3'),
    ButtonModel.deleteAll('4-0'),
    ButtonModel.deleteAll('4-1'),
    ButtonModel.deleteAll('4-2'),
    ButtonModel.add('4-3'),
    ButtonModel.deleteAll('5-0'),
    ButtonModel.deleteAll('5-1'),
    ButtonModel.deleteAll('5-2'),
    ButtonModel.equals('5-3'),
    ButtonModel.deleteAll('6-0'),
    ButtonModel.deleteAll('6-1'),
    ButtonModel.deleteAll('6-2'),
    ButtonModel.none('6-3')
  ];
}
