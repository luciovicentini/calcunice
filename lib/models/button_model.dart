// dependiendo de la posicion que se este renderizando esta clase será responsable de:
//  - si se tiene que dibujar algo o no.
// - si la cantidad de espacios horizontales o verticales que tiene que ocupar el botón (siendo 1x1 la base)
// - el icono a dibujar
// - el color del boton
// - la acción del boton

import 'package:calcunice/models/button_action.dart';
import 'package:flutter/material.dart';

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
