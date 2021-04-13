import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:calcunice/providers.dart';

class CalculatorScreenWidget extends StatelessWidget {
  const CalculatorScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 9,
              child: Consumer(
                builder: (context, watch, child) {
                  final list = watch(historicListModelProvider.state).when(
                    empty: () => <String>[],
                    list: (expressions) => expressions.reversed.toList(),
                  );
                  return AnimatedList(
                    key: animatedListKey,
                    physics: const ClampingScrollPhysics(),
                    reverse: true,
                    initialItemCount: list.length,
                    itemBuilder: (context, index, animation) => AlignTransition(
                      alignment: animation.drive(
                        AlignmentTween(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          list[index],
                          textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.bodyText1,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 4),
            Expanded(
              flex: 3,
              child: Consumer(
                builder: (context, watch, child) => Text(
                  watch(displayProvider.state).maybeWhen(
                    expression: (exp) => exp,
                    orElse: () => '',
                  ),
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.bodyText2,
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      );
}
