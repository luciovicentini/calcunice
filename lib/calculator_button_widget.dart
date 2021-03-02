import 'package:calcunice/calculator_button.dart';
import 'package:flutter/material.dart';

class CalculatorButtonWidget extends StatelessWidget {
  const CalculatorButtonWidget(this._calculatorButton, {Key key})
      : super(key: key);
  final CalculatorButton _calculatorButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(_calculatorButton);
      },
      child: Container(
        height: _calculatorButton.height,
        width: _calculatorButton.width,
        child: _calculatorButton.icon,
        decoration: BoxDecoration(
            color: _calculatorButton.color,
            borderRadius: BorderRadius.circular(26.0)),
      ),
    );
  }
}
