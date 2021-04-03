import 'package:calcunice/models/button_model.dart';
import 'package:calcunice/models/display_model.dart';
import 'package:calcunice/models/display_state.dart';
import 'package:flutter/material.dart';
import 'package:calcunice/models/button_action.dart';
import 'package:calcunice/models/calculator_model.dart';
import 'package:calcunice/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnimatedCalculatorButtonWidget extends AnimatedWidget {
  final double buttonHeight;
  final double buttonWidth;
  final ButtonModel calculatorButton;
  final AnimationController elevation;

  const AnimatedCalculatorButtonWidget({
    required this.buttonHeight,
    required this.buttonWidth,
    required this.calculatorButton,
    required this.elevation,
  }) : super(listenable: elevation);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.black,
      borderRadius: BorderRadius.circular(26.0),
      elevation: elevation.value,
      child: InkWell(
        onTapDown: (_) => elevation.reverse(),
        onTap: () => onTap(context.read),
        child: Container(
          height: buttonHeight,
          width: buttonWidth,
          child: _getButtonChild(calculatorButton.icon, calculatorButton.text,
              calculatorButton.childColor),
          decoration: BoxDecoration(
            color: calculatorButton.backgroundColor,
            borderRadius: BorderRadius.circular(26.0),
          ),
        ),
      ),
    );
  }

  void onTap(read) {
    final DisplayModel displayModel = read(displayProv);
    final DisplayState state = read(displayProv.state);
    displayModel.onButtonTap(calculatorButton.buttonAction);
    // calculatorModel.onButtonTap(calculatorButton.buttonAction);
    if (calculatorButton.buttonAction == ButtonAction.equals &&
        state != DisplayState.empty()) {
      final CalculatorModel calculatorModel =
          read(calculatorProv(displayModel.expression));
      final String newExpression =
          '${displayModel.getDisplay()} = ${calculatorModel.getResult()}';
      updateHistoricExpressionsList(read, newExpression);
      displayModel.clearLine();
    }
  }

  void updateHistoricExpressionsList(read, String newExpression) {
    final expressionList = read(historicCalculationsProvider).state;
    expressionList.add(newExpression);
    read(historicCalculationsProvider).state = expressionList;
    animatedListKey.currentState?.insertItem(0);
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
