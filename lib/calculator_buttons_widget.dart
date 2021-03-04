import 'dart:developer';

import 'package:calcunice/calculator_button.dart';
import 'package:calcunice/calculator_button_widget.dart';
import 'package:calcunice/keyboard_layout_calculation.dart';
import 'package:flutter/material.dart';

class CalculatorButtonsWidget extends StatelessWidget {
  const CalculatorButtonsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var keyboardLayout = KeyboardLayoutCalculation(
            constraints.maxWidth, constraints.maxHeight);
        log(keyboardLayout.toString());

        return Stack(
          children: [
            for (int i = 0; i < KeyboardLayoutCalculation.TOTAL_ROWS; i++)
              for (int j = 0; j < KeyboardLayoutCalculation.BUTTONS_IN_ROW; j++)
                Positioned(
                  child: CalculatorButtonWidget(
                    CalculatorButton(
                        color: Colors.red,
                        icon: Icon(Icons.add),
                        height: keyboardLayout.heightSize,
                        width: keyboardLayout.widthSize),
                  ),
                  top: (keyboardLayout.heightSize +
                          keyboardLayout.heightMargin) *
                      i,
                  left:
                      (keyboardLayout.widthSize + keyboardLayout.widthMargin) *
                          j,
                )
          ],
        );
      },
    );
  }
}
