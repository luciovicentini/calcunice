import 'package:calcunice/button_model.dart';
import 'package:calcunice/calculator_button_widget.dart';
import 'package:calcunice/keyboard_layout_calculator.dart';
import 'package:flutter/material.dart';

class KeyboardLayoutWidget extends StatelessWidget {
  const KeyboardLayoutWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var keyboardLayout =
            KeyboardLayoutCalculator.calculateFromContainerSize(
                constraints.maxWidth, constraints.maxHeight);

        return Stack(
          children: [
            for (var button in ButtonModel.listButtons)
              CalculatorButtonWidget(button, keyboardLayout),
          ],
        );
      },
    );
  }
}
