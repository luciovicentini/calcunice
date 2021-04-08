import 'package:calcunice/models/button_action.dart';
import 'package:calcunice/providers.dart';
import 'package:calcunice/ui/calculator_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants.dart';
import '../models/keyboard_layout_calculator.dart';
import '../models/button_model.dart';

class KeyboardLayoutWidget extends StatelessWidget {
  const KeyboardLayoutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var keyboardLayout =
            KeyboardLayoutCalculator.calculateFromContainerSize(
                constraints.maxWidth, constraints.maxHeight);
        return Stack(
          children: [
            Consumer(
              builder: (context, watch, child) {
                return CalculatorButtonWidget(
                    ButtonModel(
                      icon: null,
                      text: watch(clearButtonTextProvider),
                      childColor: kLightResultScreenTextColor,
                      backgroundColor: kLightClearButtonBackground,
                      positionX: 0,
                      positionY: 0,
                      buttonAction: watch(clearButtonActionProvider),
                    ),
                    keyboardLayout);
              },
            ),
            for (var button in listButtons)
              CalculatorButtonWidget(button, keyboardLayout),
          ],
        );
      },
    );
  }
}

const listButtons = <ButtonModel>[
  ButtonModel(
    icon: null,
    text: "\u221a",
    childColor: kNumberBackgroundColor,
    backgroundColor: kLightPurpleBackbround,
    positionX: 0,
    positionY: 1,
    buttonAction: ButtonAction.squareRoot,
  ),
  ButtonModel(
    icon: null,
    text: "7",
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 0,
    positionY: 2,
    buttonAction: ButtonAction.seven,
  ),
  ButtonModel(
    icon: null,
    text: "4",
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 0,
    positionY: 3,
    buttonAction: ButtonAction.four,
  ),
  ButtonModel(
    icon: null,
    text: "1",
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 0,
    positionY: 4,
    buttonAction: ButtonAction.one,
  ),
  ButtonModel(
    icon: null,
    text: ".",
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 0,
    positionY: 5,
    buttonAction: ButtonAction.point,
  ),
  ButtonModel(
    icon: null,
    text: "(",
    childColor: kNumberBackgroundColor,
    backgroundColor: kLightPurpleBackbround,
    positionX: 1,
    positionY: 0,
    buttonAction: ButtonAction.openParenthesis,
  ),
  ButtonModel(
    icon: null,
    text: "%",
    childColor: kNumberBackgroundColor,
    backgroundColor: kLightPurpleBackbround,
    positionX: 1,
    positionY: 1,
    buttonAction: ButtonAction.percentage,
  ),
  ButtonModel(
    icon: null,
    text: "8",
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 1,
    positionY: 2,
    buttonAction: ButtonAction.eight,
  ),
  ButtonModel(
    icon: null,
    text: "5",
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 1,
    positionY: 3,
    buttonAction: ButtonAction.five,
  ),
  ButtonModel(
    icon: null,
    text: "2",
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 1,
    positionY: 4,
    buttonAction: ButtonAction.two,
  ),
  ButtonModel(
    icon: null,
    text: "0",
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 1,
    positionY: 5,
    buttonAction: ButtonAction.zero,
  ),
  ButtonModel(
    icon: null,
    text: ")",
    childColor: kNumberBackgroundColor,
    backgroundColor: kLightPurpleBackbround,
    positionX: 2,
    positionY: 0,
    buttonAction: ButtonAction.closeParenthesis,
  ),
  ButtonModel(
    icon: null,
    text: "+ -",
    childColor: kNumberBackgroundColor,
    backgroundColor: kLightPurpleBackbround,
    positionX: 2,
    positionY: 1,
    buttonAction: ButtonAction.plusMinusToggle,
  ),
  ButtonModel(
    icon: null,
    text: "9",
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 2,
    positionY: 2,
    buttonAction: ButtonAction.nine,
  ),
  ButtonModel(
    icon: null,
    text: "6",
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 2,
    positionY: 3,
    buttonAction: ButtonAction.six,
  ),
  ButtonModel(
    icon: null,
    text: "3",
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 2,
    positionY: 4,
    buttonAction: ButtonAction.three,
  ),
  ButtonModel(
    icon: Icons.backspace,
    text: null,
    childColor: kLightResultScreenTextColor,
    backgroundColor: kNumberBackgroundColor,
    positionX: 2,
    positionY: 5,
    buttonAction: ButtonAction.backspace,
  ),
  ButtonModel(
    icon: null,
    text: 'x',
    childColor: kLightResultScreenTextColor,
    backgroundColor: kBasicOperationBackgroundLightColor,
    positionX: 3,
    positionY: 0,
    buttonAction: ButtonAction.multiplication,
  ),
  ButtonModel(
    icon: null,
    text: '÷',
    childColor: kLightResultScreenTextColor,
    backgroundColor: kBasicOperationBackgroundLightColor,
    positionX: 3,
    positionY: 1,
    buttonAction: ButtonAction.division,
  ),
  ButtonModel(
    icon: null,
    text: '-',
    childColor: kLightResultScreenTextColor,
    backgroundColor: kBasicOperationBackgroundLightColor,
    positionX: 3,
    positionY: 2,
    buttonAction: ButtonAction.substraction,
  ),
  ButtonModel(
    icon: null,
    text: '+',
    childColor: kLightResultScreenTextColor,
    backgroundColor: kBasicOperationBackgroundLightColor,
    positionX: 3,
    positionY: 3,
    buttonAction: ButtonAction.addition,
  ),
  ButtonModel(
    stepsY: 2,
    icon: null,
    text: '=',
    childColor: kNumberBackgroundColor,
    backgroundColor: kBasicOperationBackgroundColor,
    positionX: 3,
    positionY: 4,
    buttonAction: ButtonAction.equals,
  ),
];
