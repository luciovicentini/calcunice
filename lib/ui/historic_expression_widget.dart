import 'package:calcunice/providers.dart';
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
          showDialogFromSystem(item, context);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Text(
            item,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyText1,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );

  Future<void> showDialogFromSystem(String expression, BuildContext context) =>
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Expression Matematica'),
          content: Text(item),
          actions: [
            TextButton(
                onPressed: () {
                  dismissDialog(context);
                },
                child: const Text('OK')),
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
                child: const Text('Borrar')),
            TextButton(onPressed: () {}, child: const Text('Resultado')),
          ],
        ),
      );

  void dismissDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('item', item));
  }
}
