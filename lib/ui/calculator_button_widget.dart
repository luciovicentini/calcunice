import 'package:calcunice/ui/ButtonAnimated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../models/keyboard_layout_calculator.dart';
import '../models/button_model.dart';

class CalculatorButtonWidget extends HookWidget {
  const CalculatorButtonWidget(this.calculatorButton, this.keyboardLayout,
      {Key? key})
      : super(key: key);

  final ButtonModel calculatorButton;
  final KeyboardLayoutCalculator keyboardLayout;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
        duration: Duration(milliseconds: 100), initialValue: 4, upperBound: 4);
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
    final buttonHeight =
        keyboardLayout.calculateHeight(calculatorButton.stepsY);
    final buttonWidth = keyboardLayout.calculateWidth(calculatorButton.stepsX);
    return Positioned(
      child: AnimatedCalculatorButtonWidget(
        buttonHeight: buttonHeight,
        buttonWidth: buttonWidth,
        calculatorButton: calculatorButton,
        elevation: animationController,
      ),
      top: (keyboardLayout.heightSize + keyboardLayout.heightMargin) *
          calculatorButton.positionY,
      left: (keyboardLayout.widthSize + keyboardLayout.widthMargin) *
          calculatorButton.positionX,
    );
  }
}
