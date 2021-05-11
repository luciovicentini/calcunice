import 'package:calcunice/ui/custom_top_bar_widget.dart';
import 'package:calcunice/ui/expression_display_widget.dart';
import 'package:calcunice/ui/historic_expression_list_widget.dart';
import 'package:calcunice/ui/keyboard_layout_widget.dart';
import 'package:flutter/material.dart';

class VerticalCalculatorWidget extends StatelessWidget {
  const VerticalCalculatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          CustomTopBarWidget(),
          SizedBox(height: 8),
          Flexible(
            flex: 9,
            child: HistoricExpressionListWidget(),
          ),
          ExpressionDisplayWidget(),
          SizedBox(height: 8),
          Flexible(
            flex: 20,
            child: KeyboardLayoutWidget(),
          ),
        ],
      );
}
