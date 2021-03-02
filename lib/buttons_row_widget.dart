import 'package:calcunice/calculator_button.dart';
import 'package:flutter/material.dart';

class ButtonsRowWidget extends StatelessWidget {
  final List<CalculatorButton> calculatorButton;

  const ButtonsRowWidget({
    @required this.calculatorButton,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [],
    );
  }
}
