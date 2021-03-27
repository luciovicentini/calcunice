import 'package:calcunice/ui/calculator_button_widget.dart';
import 'package:flutter/material.dart';

import '../models/keyboard_layout_calculator.dart';
import '../models/button_model.dart';

class KeyboardLayoutWidget extends StatelessWidget {
  const KeyboardLayoutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var keyboardLayout =
            KeyboardLayoutCalculator.calculateFromContainerSize(
                constraints.maxWidth, constraints.maxHeight);
        return Stack(
          children: [
            for (var button in listButtons)
              CalculatorButtonWidget(button, keyboardLayout),
          ],
        );
      },
    );
  }
}
