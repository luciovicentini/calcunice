import 'package:calcunice/models/button_action.dart';
import 'package:calcunice/models/button_model.dart';
import 'package:calcunice/models/display_model.dart';
import 'package:calcunice/models/historic_list_model.dart';
import 'package:flutter/material.dart';
import 'package:calcunice/models/calculator_model.dart';
import 'package:calcunice/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnimatedCalculatorButtonWidget extends AnimatedWidget {
  final double buttonHeight;
  final double buttonWidth;
  final ButtonModel calculatorButton;
  final AnimationController animationController;

  AnimatedCalculatorButtonWidget({
    required this.buttonHeight,
    required this.buttonWidth,
    required this.calculatorButton,
    required this.animationController,
  }) : super(listenable: animationController);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.black,
      borderRadius: BorderRadius.circular(26.0),
      elevation: animationController.value,
      child: GestureDetector(
        // splashColor: Colors.transparent,
        // highlightColor: Colors.transparent,
        onTapDown: (_) => animationController.reverse(),
        onTapUp: (_) => animationController.forward(),
        onTap: () => onTap(context.read),
        child: Container(
          height: buttonHeight,
          width: buttonWidth,
          child: _getButtonChild(calculatorButton.icon, calculatorButton.text,
              calculatorButton.childColor, context),
          decoration: BoxDecoration(
            color: calculatorButton.backgroundColor ??
                Theme.of(context).buttonColor,
            borderRadius: BorderRadius.circular(26.0),
          ),
        ),
      ),
    );
  }

  void onTap(read) {
    final DisplayModel displayModel = read(displayProv);
    bool getResult = displayModel.onButtonTap(calculatorButton.buttonAction);
    if (getResult) {
      handleResult(read, displayModel);
    }
    if (calculatorButton.buttonAction == ButtonAction.clearHistoricList) {
      final HistoricListModel historicListModel =
          read(historicListModelProvider);
      historicListModel.clearList();
      animatedListKey = GlobalKey<AnimatedListState>();
    }
  }

  void handleResult(read, displayModel) {
    final CalculatorModel calculatorModel =
        read(calculatorProv(displayModel.expression));
    final newExpression =
        '${displayModel.getDisplay()} = ${calculatorModel.getResult()}';
    updateHistoricExpressionsList(read, newExpression);
    displayModel.clearLine(true);
  }

  void updateHistoricExpressionsList(read, String newExpression) {
    final HistoricListModel historicListModel = read(historicListModelProvider);
    historicListModel.addNewMathExpression(newExpression);
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
}
