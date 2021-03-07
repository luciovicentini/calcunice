// dependiendo de la posicion que se este renderizando esta clase será responsable de:
//  - si se tiene que dibujar algo o no.
// - si la cantidad de espacios horizontales o verticales que tiene que ocupar el botón (siendo 1x1 la base)
// - el icono a dibujar
// - el color del boton
// - la acción del boton

import 'dart:developer';

import 'package:flutter/material.dart';

class ButtonModel {
  int stepsX = 1;
  int stepsY = 1;
  int positionX = 0;
  int positionY = 0;
  IconData icon;
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

  static ButtonModel fromRenderingStep(int row, int column) {
    ButtonModel button = _mapButtonModel["$row$column"];
    if (button != null) {
      return button
        ..positionY = row
        ..positionX = column;
    } else {
      return ButtonModel.none();
    }
  }

  ButtonModel.none()
      : stepsX = 0,
        stepsY = 0;

  ButtonModel.deleteAll()
      : icon = Icons.arrow_upward_rounded,
        backgroundColor = Colors.grey;

  ButtonModel.delete()
      : icon = Icons.copyright,
        backgroundColor = Colors.purpleAccent;

  ButtonModel.equals()
      : stepsX = 1,
        stepsY = 2,
        icon = Icons.menu,
        iconColor = Colors.white,
        backgroundColor = Colors.orange;

  ButtonModel.add()
      : icon = Icons.add,
        backgroundColor = Colors.orangeAccent;

  ButtonModel.subtract()
      : icon = Icons.favorite,
        backgroundColor = Colors.orangeAccent;

  @override
  String toString() {
    return 'ButtonModel{stepsX: $stepsX, stepsY: $stepsY, positionX: $positionX, positionY: $positionY, icon: $icon, backgroundColor: $backgroundColor, action: $action}';
  }
}

Map<String, ButtonModel> _mapButtonModel = {
  "00": ButtonModel.none(),
  "01": ButtonModel.none(),
  "02": ButtonModel.none(),
  "03": ButtonModel.deleteAll(),
  "10": ButtonModel.delete(),
  "11": ButtonModel.none(),
  "12": ButtonModel.deleteAll(),
  "13": ButtonModel.deleteAll(),
  "20": ButtonModel.deleteAll(),
  "21": ButtonModel.deleteAll(),
  "22": ButtonModel.deleteAll(),
  "23": ButtonModel.deleteAll(),
  "30": ButtonModel.deleteAll(),
  "31": ButtonModel.deleteAll(),
  "32": ButtonModel.deleteAll(),
  "33": ButtonModel.subtract(),
  "40": ButtonModel.deleteAll(),
  "41": ButtonModel.deleteAll(),
  "42": ButtonModel.deleteAll(),
  "43": ButtonModel.add(),
  "50": ButtonModel.deleteAll(),
  "51": ButtonModel.deleteAll(),
  "52": ButtonModel.deleteAll(),
  "53": ButtonModel.equals(),
  "60": ButtonModel.deleteAll(),
  "61": ButtonModel.deleteAll(),
  "62": ButtonModel.deleteAll(),
  "63": ButtonModel.none()
};
