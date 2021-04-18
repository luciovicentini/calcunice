import 'package:calcunice/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExpressionDisplayWidget extends HookWidget {
  const ExpressionDisplayWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = useProvider(displayProvider.state).maybeWhen(
      expression: (exp) => exp,
      orElse: () => '',
    );
    final controller = useScrollController();

    scrollToEndOfTextField(controller);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      child: Text(
        text,
        textAlign: TextAlign.end,
        style: Theme.of(context).textTheme.bodyText2,
        maxLines: 1,
      ),
    );
  }

  void scrollToEndOfTextField(ScrollController controller) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (controller.hasClients) {
        controller.jumpTo(controller.position.maxScrollExtent);
      }
    });
  }
}
