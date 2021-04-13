import 'package:calcunice/ui/animated_calculator_button_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:calcunice/models/keyboard_layout_calculator.dart';
import 'package:calcunice/models/button_model.dart';

class CalculatorButtonWidget extends HookWidget {
  const CalculatorButtonWidget(this.calculatorButton, this.keyboardLayout,
      {Key? key})
      : super(key: key);

  final ButtonModel calculatorButton;
  final KeyboardLayoutCalculator keyboardLayout;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
        duration: const Duration(milliseconds: 100),
        initialValue: 4,
        upperBound: 4);
    final buttonHeight =
        keyboardLayout.calculateHeight(calculatorButton.stepsY);
    final buttonWidth = keyboardLayout.calculateWidth(calculatorButton.stepsX);
    return Positioned(
      top: (keyboardLayout.heightSize + keyboardLayout.heightMargin) *
          calculatorButton.positionY,
      left: (keyboardLayout.widthSize + keyboardLayout.widthMargin) *
          calculatorButton.positionX,
      child: AnimatedCalculatorButtonWidget(
        buttonHeight: buttonHeight,
        buttonWidth: buttonWidth,
        calculatorButton: calculatorButton,
        animationController: animationController,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<ButtonModel>('calculatorButton', calculatorButton));
    properties.add(DiagnosticsProperty<KeyboardLayoutCalculator>(
        'keyboardLayout', keyboardLayout));
  }
}
