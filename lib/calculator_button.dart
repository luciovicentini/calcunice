import 'package:flutter/material.dart';

class CalculatorButton {
  final Color color;
  final Icon icon;
  final double height;
  final double width;

  const CalculatorButton(
      {@required this.color,
      @required this.icon,
      this.height = 0,
      this.width = 0});
}
