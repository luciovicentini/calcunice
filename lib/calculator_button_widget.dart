import 'dart:developer';

import 'package:calcunice/keyboard_layout_calculator.dart';
import 'package:flutter/material.dart';

import 'button_model.dart';

class CalculatorButtonWidget extends StatelessWidget {
  CalculatorButtonWidget(this.calculatorButton, this.keyboardLayout, {Key key})
      : super(key: key);

  final ButtonModel calculatorButton;
  final KeyboardLayoutCalculator keyboardLayout;

  @override
  Widget build(BuildContext context) {
    log(calculatorButton.toString());
    final buttonHeight =
        keyboardLayout.calculateHeight(calculatorButton.stepsY);
    final buttonWidth = keyboardLayout.calculateWidth(calculatorButton.stepsX);
    return Positioned(
      child: InkWell(
        onTap: () {
          print(calculatorButton);
        },
        child: Container(
          height: buttonHeight,
          width: buttonWidth,
          child: Icon(
            calculatorButton.icon,
            color: calculatorButton.iconColor,
          ),
          decoration: BoxDecoration(
            color: calculatorButton.backgroundColor,
            borderRadius: BorderRadius.circular(26.0),
          ),
        ),
      ),
      top: (keyboardLayout.heightSize + keyboardLayout.heightMargin) *
          calculatorButton.positionY,
      left: (keyboardLayout.widthSize + keyboardLayout.widthMargin) *
          calculatorButton.positionX,
    );
  }
}
