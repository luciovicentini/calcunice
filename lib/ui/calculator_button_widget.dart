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

  void onButtonTap(read) {
    final String displayString = read(displayProvider).state;
    if (calculatorButton.action != null) {
      read(displayProvider).state = calculatorButton.action!(displayString);
    } else {
      if (displayString.isEmpty) return;

      final calculator = read(calculatorProvider(displayString));
      final historicListProviderList = read(historicCalculationsProvider).state;
      historicListProviderList.add('$displayString = ${calculator.result}');
      read(historicCalculationsProvider).state = historicListProviderList;
      read(displayProvider).state = '';
    }
  }

  Widget _getButtonChild(Object? icon, Color? iconColor, BuildContext context) {
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
