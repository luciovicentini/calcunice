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
          child: _getButtonChild(
              calculatorButton.icon, calculatorButton.iconColor, context),
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

  Widget _getButtonChild(Object icon, Color iconColor, BuildContext context) {
    log('Icon is ${icon.runtimeType} - Icon is String: ${icon is String}');
    if (icon is IconData) {
      return Icon(
        icon,
        color: iconColor,
      );
    } else if (icon is String) {
      return Center(
        child: Text(
          icon,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: iconColor,
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
          // style: TextStyle(
          //   color: iconColor,
          //
          // ),
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
