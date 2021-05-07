import 'package:flutter/material.dart';

class DialogWidget {
  static Future<void> showDialogFromSystem(
    String expression,
    List<Widget>? actions,
    BuildContext context,
  ) =>
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: Theme.of(context).backgroundColor,
          content: Text(
            expression,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontSize: 20,
                ),
          ),
          actions: actions,
        ),
      );

  static void dismissDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
