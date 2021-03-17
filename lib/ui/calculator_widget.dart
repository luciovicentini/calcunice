import 'keyboard_layout_widget.dart';
import 'package:calcunice/ui/calculator_screen_widget.dart';
import 'package:calcunice/ui/dark_light_switch_widget.dart';
import 'package:flutter/material.dart';

class CalculatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: DarkLightSwitchWidget(),
          flex: 2,
        ),
        Flexible(
          child: CalculatorScreenWidget(),
          flex: 9,
        ),
        Flexible(
          flex: 25,
          child: Container(
            child: KeyboardLayoutWidget(),
          ),
        ),
      ],
    );
  }
}
