import 'keyboard_layout_widget.dart';
import 'package:calcunice/calculator_screen_widget.dart';
import 'package:calcunice/dark_light_switch_widget.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: DarkLightSwitchWidget(),
          flex: 2,
        ),
        /* SizedBox(height: 4.0), */
        Flexible(
          child: CalculatorScreenWidget(),
          flex: 9,
        ),
        SizedBox(height: 8.0),
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
