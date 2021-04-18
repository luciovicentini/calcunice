import 'package:calcunice/ui/expression_display_widget.dart';
import 'package:calcunice/ui/historic_expression_list_widget.dart';
import 'package:flutter/material.dart';

class CalculatorScreenWidget extends StatelessWidget {
  const CalculatorScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Expanded(
              flex: 9,
              child: HistoricExpressionListWidget(),
            ),
            SizedBox(height: 4),
            Expanded(
              flex: 3,
              child: ExpressionDisplayWidget(),
            ),
          ],
        ),
      );
}
