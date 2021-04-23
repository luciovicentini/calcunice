import 'package:calcunice/providers.dart';
import 'package:calcunice/ui/historic_expression_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HistoricExpressionListWidget extends ConsumerWidget {
  const HistoricExpressionListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
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
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: HistoricExpressionWidget(item: list[index]),
      ),
    );
  }
}
