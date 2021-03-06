import 'package:calcunice/common/calculator_exception.dart';
import 'package:calcunice/models/button_action.dart';
import 'package:calcunice/models/button_model.dart';
import 'package:calcunice/models/display_model.dart';
import 'package:calcunice/providers.dart';
import 'package:calcunice/ui/dialog_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnimatedCalculatorButtonWidget extends AnimatedWidget {
  const AnimatedCalculatorButtonWidget({
    required this.buttonHeight,
    required this.buttonWidth,
    required this.calculatorButton,
    required this.animationController,
    Key? key,
  }) : super(listenable: animationController, key: key);

  final double buttonHeight;
  final double buttonWidth;
  final ButtonModel calculatorButton;
  final AnimationController animationController;

  void _handleDragEnd(DragEndDetails details) {
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) => PhysicalModel(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
        elevation: animationController.value,
        child: GestureDetector(
          onTapDown: (_) => animationController.reverse(),
          onTapUp: (_) => animationController.forward(),
          onHorizontalDragEnd: _handleDragEnd,
          onVerticalDragEnd: _handleDragEnd,
          onTap: () => _onTap(context),
          child: Container(
            height: buttonHeight,
            width: buttonWidth,
            decoration: BoxDecoration(
              color: calculatorButton.backgroundColor ??
                  Theme.of(context).buttonColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: _getButtonChild(calculatorButton.icon, calculatorButton.text,
                calculatorButton.childColor, context),
          ),
        ),
      );

  void _onTap(BuildContext context) {
    final displayModel = context.read(displayProvider);
    final historicModel = context.read(historicListModelProvider);
    final lastResult = historicModel.getLastExpressionResult();
    final getResult =
        displayModel.onButtonTap(calculatorButton.buttonAction, lastResult);
    if (getResult) {
      _handleResult(context, displayModel);
    }
    if (calculatorButton.buttonAction == ButtonAction.clearHistoricList) {
      (context.read(historicListModelProvider)).clearList();
      animatedListKey = GlobalKey<AnimatedListState>();
    }
  }

  void _handleResult(BuildContext context, DisplayModel displayModel) {
    final calculatorModel =
        context.read(calculatorProv(displayModel.expression));
    try {
      final stringResult = calculatorModel.getStringResult();
      final newExpression = '${displayModel.getDisplay()} = $stringResult';
      _updateHistoricExpressionsList(context, newExpression);
      displayModel.setResult(stringResult);
    } on CalculatorException catch (e) {
      showErrorDialog(e, context);
    }
  }

  void showErrorDialog(CalculatorException e, BuildContext context) {
    DialogWidget.showDialogFromSystem(
        'Error: ${e.cause}',
        [
          TextButton(
            onPressed: () {
              DialogWidget.dismissDialog(context);
            },
            child: const Text('OK'),
          )
        ],
        context);
  }

  void _updateHistoricExpressionsList(
    BuildContext context,
    String newExpression,
  ) {
    context.read(historicListModelProvider).addNewMathExpression(newExpression);
    animatedListKey.currentState?.insertItem(0);
  }

  Widget _getButtonChild(
    IconData? icon,
    String? text,
    Color? childColor,
    BuildContext context,
  ) {
    if (icon != null) {
      return Icon(
        icon,
        color: childColor ?? Theme.of(context).textTheme.button!.color,
      );
    } else {
      return Center(
        child: Text(
          text!,
          textAlign: TextAlign.center,
          style:
              Theme.of(context).textTheme.button!.copyWith(color: childColor),
        ),
      );
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DoubleProperty('buttonHeight', buttonHeight))
      ..add(DoubleProperty('buttonWidth', buttonWidth))
      ..add(DiagnosticsProperty<ButtonModel>(
          'calculatorButton', calculatorButton))
      ..add(DiagnosticsProperty<AnimationController>(
          'animationController', animationController));
  }
}
