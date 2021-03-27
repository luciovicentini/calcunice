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
          onTap: () {
            onButtonTap(context.read);
          },
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

  void onButtonTap(read) {
    /* final String displayString = read(displayProvider).state;
    final String expressionString = read(expressionProvider).state;
    if (calculatorButton.isEqualButton) {
      if (expressionString.isEmpty) return;
      final calculator = read(calculatorProvider(expressionString));
      final historicListProviderList = read(historicCalculationsProvider).state;
      historicListProviderList.add('$displayString = ${calculator.result}');
      read(historicCalculationsProvider).state = historicListProviderList;
      read(displayProvider).state = '';
      read(expressionProvider).state = '';
    } else {
      read(displayProvider).state =
          calculatorButton.displayAction!(displayString);
      read(expressionProvider).state =
          calculatorButton.expressionAction!(expressionString);
    } */
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
