import 'package:flutter/material.dart';

import '../models/keyboard_layout_calculator.dart';
import '../models/button_model.dart';

class CalculatorButtonWidget extends StatelessWidget {
  CalculatorButtonWidget(this.calculatorButton, this.keyboardLayout, {Key key})
      : super(key: key);

  final ButtonModel calculatorButton;
  final KeyboardLayoutCalculator keyboardLayout;

  @override
  Widget build(BuildContext context) {
    final buttonHeight =
        keyboardLayout.calculateHeight(calculatorButton.stepsY);
    final buttonWidth = keyboardLayout.calculateWidth(calculatorButton.stepsX);
    return Positioned(
      child: PhysicalModel(
        color: Colors.black,
        borderRadius: BorderRadius.circular(26.0),
        elevation: 4,
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
      ),
      top: (keyboardLayout.heightSize + keyboardLayout.heightMargin) *
          calculatorButton.positionY,
      left: (keyboardLayout.widthSize + keyboardLayout.widthMargin) *
          calculatorButton.positionX,
    );
  }

  Widget _getButtonChild(Object icon, Color iconColor, BuildContext context) {
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
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
