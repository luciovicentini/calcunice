import 'package:calcunice/models/button_action.dart';
import 'package:calcunice/models/button_model.dart';
import 'package:calcunice/models/display_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:calcunice/providers.dart';
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

  @override
  Widget build(BuildContext context) => PhysicalModel(
        color: Colors.black,
        borderRadius: BorderRadius.circular(26),
        elevation: animationController.value,
        child: GestureDetector(
          // splashColor: Colors.transparent,
          // highlightColor: Colors.transparent,
          onTapDown: (_) => animationController.reverse(),
          onTapUp: (_) => animationController.forward(),
          onTap: () => _onTap(context),
          child: Container(
            height: buttonHeight,
            width: buttonWidth,
            decoration: BoxDecoration(
              color: calculatorButton.backgroundColor ??
                  Theme.of(context).buttonColor,
              borderRadius: BorderRadius.circular(26),
            ),
            child: _getButtonChild(calculatorButton.icon, calculatorButton.text,
                calculatorButton.childColor, context),
          ),
        ),
      );

  void _onTap(BuildContext context) {
    final displayModel = context.read(displayProvider);
    final getResult = displayModel.onButtonTap(calculatorButton.buttonAction);
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
    final newExpression =
        '${displayModel.getDisplay()} = ${calculatorModel.getStringResult()}';
    _updateHistoricExpressionsList(context, newExpression);
    displayModel.clearLine(shouldUpdateState: true);
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
    properties.add(DoubleProperty('buttonHeight', buttonHeight));
    properties.add(DoubleProperty('buttonWidth', buttonWidth));
    properties.add(
        DiagnosticsProperty<ButtonModel>('calculatorButton', calculatorButton));
    properties.add(DiagnosticsProperty<AnimationController>(
        'animationController', animationController));
  }
}
