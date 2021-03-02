import 'calculator_buttons_widget.dart';
import 'package:calcunice/calculator_screen_widget.dart';
import 'package:calcunice/dark_light_switch_widget.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: DarkLightSwitchWidget(),
          flex: 2,
        ),
        Flexible(
          child: CalculatorScreenWidget(),
          flex: 8,
        ),
        SizedBox(
          height: 8.0,
        ),
        Flexible(
          flex: 28,
          child: CalculatorButtonsWidget(),
        ),
      ],
    );
  }
}
