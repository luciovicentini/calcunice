import 'package:calcunice/calculator_button.dart';
import 'package:calcunice/calculator_button_widget.dart';
import 'package:flutter/material.dart';

class CalculatorButtonsWidget extends StatelessWidget {
  const CalculatorButtonsWidget({Key key}) : super(key: key);

  final buttonsPerRow = 4;
  final amountOfRows = 7;
  final double buttonWidth = 82;
  final double buttonHeight = 66;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final paddingWidth =
            (constraints.maxWidth - (buttonWidth * buttonsPerRow)) /
                (buttonsPerRow - 1);
        final paddingHeight =
            (constraints.maxHeight - (buttonHeight * amountOfRows)) /
                (amountOfRows - 1);
        return Stack(
          children: [
            for (int i = 0; i < amountOfRows; i++)
              for (int j = 0; j < buttonsPerRow; j++)
                Positioned(
                  child: CalculatorButtonWidget(CalculatorButton(
                      color: Colors.pink,
                      icon: Icon(Icons.usb_rounded),
                      height: buttonHeight,
                      width: buttonWidth)),
                  top: (buttonHeight + paddingHeight) * i,
                  left: (buttonWidth + paddingWidth) * j,
                )
          ],
        );
      },
    );
  }
}
