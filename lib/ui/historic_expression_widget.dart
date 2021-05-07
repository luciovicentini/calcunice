import 'package:calcunice/providers.dart';
import 'package:calcunice/ui/dialog_widget.dart';
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
              child: InkWell(
                onTap: () {
                  DialogWidget.showDialogFromSystem(
                    item,
                    _getDialogActionsButtons(item, context),
                    context,
                  );
                },
                child: Text(
                  '\u2026 ',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          ),
        ),
      );

  List<Widget> _getDialogActionsButtons(
          String expression, BuildContext context) =>
      [
        IconButton(
          icon: Icon(
            Icons.delete_forever,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {
            final model = context.read(historicListModelProvider);
            final index = model.getIndexOfExpression(expression);
            model.removeExpression(index);
            animatedListKey.currentState!.removeItem(
              index,
              (context, animation) => Container(),
            );
            DialogWidget.dismissDialog(context);
          },
        ),
        const SizedBox(
          width: 8,
        ),
        IconButton(
          onPressed: () {
            // _useResult(context, expression);
            DialogWidget.dismissDialog(context);
          },
          icon: Icon(
            Icons.subdirectory_arrow_left_sharp,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ];

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
