import 'dart:developer';

import 'package:calcunice/button_model.dart';
import 'package:calcunice/calculator_button_widget.dart';
import 'package:calcunice/keyboard_layout_calculator.dart';
import 'package:flutter/material.dart';

class CalculatorButtonsWidget extends StatelessWidget {
  const CalculatorButtonsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var keyboardLayout =
            KeyboardLayoutCalculator.calculateFromContainerSize(
                constraints.maxWidth, constraints.maxHeight);

        return Stack(
          children: [
            for (int i = 0; i < KeyboardLayoutCalculator.TOTAL_ROWS; i++)
              for (int j = 0; j < KeyboardLayoutCalculator.BUTTONS_IN_ROW; j++)
                CalculatorButtonWidget(ButtonModel.fromRenderingStep(i, j), keyboardLayout),
          ],
        );
      },
    );
  }
}
