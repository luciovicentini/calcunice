import 'package:calcunice/ui/keyboard_layout_widget.dart';
import 'package:calcunice/ui/calculator_screen_widget.dart';
import 'package:calcunice/ui/dark_light_switch_widget.dart';
import 'package:flutter/material.dart';

class CalculatorWidget extends StatelessWidget {
  const CalculatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Flexible(
            flex: 2,
            child: DarkLightSwitchWidget(),
          ),
          Flexible(
            flex: 9,
            child: CalculatorScreenWidget(),
          ),
          Flexible(
            flex: 25,
            child: KeyboardLayoutWidget(),
          ),
        ],
      );
}
