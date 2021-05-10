import 'package:calcunice/ui/custom_top_bar_widget.dart';
import 'package:calcunice/ui/expression_display_widget.dart';
import 'package:calcunice/ui/historic_expression_list_widget.dart';
import 'package:calcunice/ui/keyboard_layout_widget.dart';
import 'package:flutter/material.dart';

class HorizontalCalculatorWidget extends StatelessWidget {
  const HorizontalCalculatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 35,
            child: CustomTopBarWidget(),
          ),
          const SizedBox(height: 8),
          const SizedBox(
            height: 50,
            child: ExpressionDisplayWidget(),
          ),
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  flex: 10,
                  child: HistoricExpressionListWidget(),
                ),
                SizedBox(width: 8),
                Expanded(
                  flex: 20,
                  child: KeyboardLayoutWidget(),
                ),
              ],
            ),
          )
        ],
      );
}
