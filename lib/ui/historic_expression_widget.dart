import 'package:calcunice/providers.dart';
import 'package:extended_text/extended_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HistoricExpressionWidget extends StatelessWidget {
  const HistoricExpressionWidget({
    required this.item,
    Key? key,
  }) : super(key: key);

  final String item;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onLongPress: () {
          showDialogFromSystem(item, context);
        },
        onTap: () {
          _useResult(context, item);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: ExtendedText(
            item,
            style: Theme.of(context).textTheme.bodyText1,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            overflowWidget: TextOverflowWidget(
              position: TextOverflowPosition.start,
              align: TextOverflowAlign.left,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '\u2026 ',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Future<void> showDialogFromSystem(String expression, BuildContext context) =>
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: Theme.of(context).backgroundColor,
          content: Text(
            item,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontSize: 20,
                ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                final model = context.read(historicListModelProvider);
                final index = model.getIndexOfExpression(expression);
                model.removeExpression(index);
                animatedListKey.currentState!.removeItem(
                  index,
                  (context, animation) => Container(),
                );
                dismissDialog(context);
              },
              child: Icon(
                Icons.delete_forever,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
            TextButton(
              onPressed: () {
                _useResult(context, expression);
                dismissDialog(context);
              },
              child: Icon(
                Icons.subdirectory_arrow_left_sharp,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ],
        ),
      );

  void dismissDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _useResult(BuildContext context, String expression) {
    final displayModel = context.read(displayProvider);
    displayModel.useResultOfExpression(expression);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('item', item));
  }
}
