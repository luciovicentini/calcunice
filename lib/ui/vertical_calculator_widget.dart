import 'package:calcunice/ui/dark_light_switch_widget.dart';
import 'package:calcunice/ui/expression_display_widget.dart';
import 'package:calcunice/ui/historic_expression_list_widget.dart';
import 'package:calcunice/ui/keyboard_layout_widget.dart';
import 'package:flutter/material.dart';

class VerticalCalculatorWidget extends StatelessWidget {
  const VerticalCalculatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            height: 35,
            child: DarkLightSwitchWidget(),
          ),
          SizedBox(height: 8),
          Flexible(
            flex: 9,
            child: HistoricExpressionListWidget(),
          ),
          SizedBox(
            height: 50,
            child: ExpressionDisplayWidget(),
          ),
          SizedBox(height: 8),
          Flexible(
            flex: 20,
            child: KeyboardLayoutWidget(),
          ),
        ],
      );
}
