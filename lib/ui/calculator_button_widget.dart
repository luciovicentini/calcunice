import 'package:calcunice/models/button_action.dart';
import 'package:calcunice/models/calculator.dart';
import 'package:calcunice/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/keyboard_layout_calculator.dart';
import '../models/button_model.dart';

class CalculatorButtonWidget extends ConsumerWidget {
  const CalculatorButtonWidget(this.calculatorButton, this.keyboardLayout,
      {Key? key})
      : super(key: key);

  final ButtonModel calculatorButton;
  final KeyboardLayoutCalculator keyboardLayout;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final buttonHeight =
        keyboardLayout.calculateHeight(calculatorButton.stepsY);
    final buttonWidth = keyboardLayout.calculateWidth(calculatorButton.stepsX);
    return Positioned(
      child: PhysicalModel(
        color: Colors.black,
        borderRadius: BorderRadius.circular(26.0),
        elevation: 4,
        child: InkWell(
          onTap: () => onTap(context.read),
          child: Container(
            height: buttonHeight,
            width: buttonWidth,
            child: _getButtonChild(
              calculatorButton.icon,
              calculatorButton.text,
              calculatorButton.childColor,
            ),
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

  void onTap(read) {
    final displayModel = read(displayProvider);
    displayModel.onButtonTap(calculatorButton.buttonAction);
    if (calculatorButton.buttonAction == ButtonAction.equals &&
        displayModel.line.isNotEmpty) {
      final calculatorModel = read(calculatorProvider);
      final String newExpression =
          handleEquals(displayModel.line, calculatorModel);
      updateHistoricExpressionsList(read, newExpression);
      displayModel.clearLine();
    }
  }

  void updateHistoricExpressionsList(read, String newExpression) {
    final expressionList = read(historicCalculationsProvider).state;
    expressionList.add(newExpression);
    read(historicCalculationsProvider).state = expressionList;
  }

  String handleEquals(String expression, Calculator calculatorModel) {
    final double result = calculatorModel.getResult(expression);
    return '$expression = $result';
  }

  Widget _getButtonChild(IconData? icon, String? text, Color childColor) {
    if (icon != null) {
      return Icon(
        icon,
        color: childColor,
      );
    } else {
      return Center(
        child: Text(
          text!,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: childColor,
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
      );
    }
  }
}
