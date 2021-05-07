import 'package:calcunice/models/button_action.dart';
import 'package:calcunice/providers.dart';
import 'package:calcunice/ui/calculator_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:calcunice/constants.dart';
import 'package:calcunice/models/keyboard_layout_calculator.dart';
import 'package:calcunice/models/button_model.dart';

class KeyboardLayoutWidget extends StatelessWidget {
  const KeyboardLayoutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final keyboardLayout =
              KeyboardLayoutCalculator.calculateFromContainerSize(
                  constraints.maxWidth, constraints.maxHeight);
          return Stack(
            children: [
              Consumer(
                builder: (context, watch, child) => CalculatorButtonWidget(
                    ButtonModel(
                      icon: null,
                      text: watch(clearButtonTextProvider),
                      childColor: kLightDisplayTextColor,
                      backgroundColor: kLightClearButtonBackground,
                      positionX: 0,
                      positionY: 0,
                      buttonAction: watch(clearButtonActionProvider),
                    ),
                    keyboardLayout),
              ),
              for (var button in listButtons)
                CalculatorButtonWidget(button, keyboardLayout),
            ],
          );
        },
      );
}

const listButtons = <ButtonModel>[
  ButtonModel(
    icon: null,
    text: '\u221a',
    childColor: kLightNumbersButtonBackgroundColor,
    backgroundColor: kLightPurpleBackground,
    positionX: 0,
    positionY: 1,
    buttonAction: ButtonAction.squareRoot,
  ),
  ButtonModel(
    icon: null,
    text: '7',
    childColor: null,
    backgroundColor: null,
    positionX: 0,
    positionY: 2,
    buttonAction: ButtonAction.seven,
  ),
  ButtonModel(
    icon: null,
    text: '4',
    childColor: null,
    backgroundColor: null,
    positionX: 0,
    positionY: 3,
    buttonAction: ButtonAction.four,
  ),
  ButtonModel(
    icon: null,
    text: '1',
    childColor: null,
    backgroundColor: null,
    positionX: 0,
    positionY: 4,
    buttonAction: ButtonAction.one,
  ),
  ButtonModel(
    icon: null,
    text: '.',
    childColor: null,
    backgroundColor: null,
    positionX: 0,
    positionY: 5,
    buttonAction: ButtonAction.point,
  ),
  ButtonModel(
    icon: null,
    text: '(',
    childColor: kLightNumbersButtonBackgroundColor,
    backgroundColor: kLightPurpleBackground,
    positionX: 1,
    positionY: 0,
    buttonAction: ButtonAction.openParenthesis,
  ),
  ButtonModel(
    icon: null,
    text: '%',
    childColor: kLightNumbersButtonBackgroundColor,
    backgroundColor: kLightPurpleBackground,
    positionX: 1,
    positionY: 1,
    buttonAction: ButtonAction.percentage,
  ),
  ButtonModel(
    icon: null,
    text: '8',
    childColor: null,
    backgroundColor: null,
    positionX: 1,
    positionY: 2,
    buttonAction: ButtonAction.eight,
  ),
  ButtonModel(
    icon: null,
    text: '5',
    childColor: null,
    backgroundColor: null,
    positionX: 1,
    positionY: 3,
    buttonAction: ButtonAction.five,
  ),
  ButtonModel(
    icon: null,
    text: '2',
    childColor: null,
    backgroundColor: null,
    positionX: 1,
    positionY: 4,
    buttonAction: ButtonAction.two,
  ),
  ButtonModel(
    icon: null,
    text: '0',
    childColor: null,
    backgroundColor: null,
    positionX: 1,
    positionY: 5,
    buttonAction: ButtonAction.zero,
  ),
  ButtonModel(
    icon: null,
    text: ')',
    childColor: kLightNumbersButtonBackgroundColor,
    backgroundColor: kLightPurpleBackground,
    positionX: 2,
    positionY: 0,
    buttonAction: ButtonAction.closeParenthesis,
  ),
  ButtonModel(
    icon: null,
    text: '+/-',
    childColor: kLightNumbersButtonBackgroundColor,
    backgroundColor: kLightPurpleBackground,
    positionX: 2,
    positionY: 1,
    buttonAction: ButtonAction.plusMinusToggle,
  ),
  ButtonModel(
    icon: null,
    text: '9',
    childColor: null,
    backgroundColor: null,
    positionX: 2,
    positionY: 2,
    buttonAction: ButtonAction.nine,
  ),
  ButtonModel(
    icon: null,
    text: '6',
    childColor: null,
    backgroundColor: null,
    positionX: 2,
    positionY: 3,
    buttonAction: ButtonAction.six,
  ),
  ButtonModel(
    icon: null,
    text: '3',
    childColor: null,
    backgroundColor: null,
    positionX: 2,
    positionY: 4,
    buttonAction: ButtonAction.three,
  ),
  ButtonModel(
    icon: Icons.backspace,
    text: null,
    childColor: null,
    backgroundColor: null,
    positionX: 2,
    positionY: 5,
    buttonAction: ButtonAction.backspace,
  ),
  ButtonModel(
    icon: null,
    text: 'x',
    childColor: kLightDisplayTextColor,
    backgroundColor: kLightBasicOperationBackgroundColor,
    positionX: 3,
    positionY: 0,
    buttonAction: ButtonAction.multiplication,
  ),
  ButtonModel(
    icon: null,
    text: '÷',
    childColor: kLightDisplayTextColor,
    backgroundColor: kLightBasicOperationBackgroundColor,
    positionX: 3,
    positionY: 1,
    buttonAction: ButtonAction.division,
  ),
  ButtonModel(
    icon: null,
    text: '-',
    childColor: kLightDisplayTextColor,
    backgroundColor: kLightBasicOperationBackgroundColor,
    positionX: 3,
    positionY: 2,
    buttonAction: ButtonAction.substraction,
  ),
  ButtonModel(
    icon: null,
    text: '+',
    childColor: kLightDisplayTextColor,
    backgroundColor: kLightBasicOperationBackgroundColor,
    positionX: 3,
    positionY: 3,
    buttonAction: ButtonAction.addition,
  ),
  ButtonModel(
    stepsY: 2,
    icon: null,
    text: '=',
    childColor: kLightNumbersButtonBackgroundColor,
    backgroundColor: kBasicOperationBackgroundColor,
    positionX: 3,
    positionY: 4,
    buttonAction: ButtonAction.equals,
  ),
];
