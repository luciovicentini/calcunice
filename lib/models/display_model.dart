import 'dart:math';

import 'package:calcunice/models/basic_expression_util.dart';
import 'package:calcunice/models/button_action.dart';
import 'package:calcunice/models/display_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DisplayModel extends StateNotifier<DisplayState>
    with BasicExpressionUtil {
  DisplayModel() : super(DisplayState.empty());

  String getDisplay() => state.when(
        empty: () => '',
        expression: (expression) => expression,
      );

  String expression = '';

  void onButtonTap(ButtonAction action) {
    _handleButtonAction(action);
    updateState();
  }

  void _handleButtonAction(ButtonAction action) {
    switch (action) {
      case ButtonAction.equals:
        break;
      case ButtonAction.one:
        expression += '1';
        break;
      case ButtonAction.two:
        expression += '2';
        break;
      case ButtonAction.three:
        expression += '3';
        break;
      case ButtonAction.four:
        expression += '4';
        break;
      case ButtonAction.five:
        expression += '5';
        break;
      case ButtonAction.six:
        expression += '6';
        break;
      case ButtonAction.seven:
        expression += '7';
        break;
      case ButtonAction.eight:
        expression += '8';
        break;
      case ButtonAction.nine:
        expression += '9';
        break;
      case ButtonAction.zero:
        expression += '0';
        break;
      case ButtonAction.point:
        // TODO: antes de agregar validar que el numero no tenga ya un punto decimal.
        expression += '.';
        break;
      case ButtonAction.backspace:
        expression = expression.substring(0, expression.length - 1);
        break;
      case ButtonAction.addition:
        // TODO: validar el ultimo char ingresado:
        //  if (es una operacion basica): reemplazar por este caracter.
        // else: agregar el character correspondiente
        expression += '+';
        break;
      case ButtonAction.substraction:
        // TODO: validar el ultimo char ingresado:
        //  if (es una operacion basica): reemplazar por este caracter.
        // else: agregar el character correspondiente
        expression += '-';
        break;
      case ButtonAction.multiplication:
        // TODO: validar el ultimo char ingresado:
        //  if (es una operacion basica): reemplazar por este caracter.
        // else: agregar el character correspondiente
        expression += 'x';
        break;
      case ButtonAction.division:
        // TODO: validar el ultimo char ingresado:
        //  if (es una operacion basica): reemplazar por este caracter.
        // else: agregar el character correspondiente
        expression += '/';
        break;
      case ButtonAction.squareRoot:
        expression += '√(';
        break;
      case ButtonAction.clearScreen:
        clearLine();
        break;
      case ButtonAction.openParenthesis:
        expression += '(';
        break;
      case ButtonAction.closeParenthesis:
        expression += ')';
        break;
      case ButtonAction.percentage:
        expression += '%';
        break;
      case ButtonAction.plusMinusToggle:
        togglePlusMinus();
        break;
      default:
        throw UnimplementedError('Button Action = $action not implemented yet');
    }
  }

  void updateState() {
    state = DisplayState.expression(_parseExpression(this.expression));
  }

  String _parseExpression(String expression) {
    expression = _insertSpacesBetweenOperators(expression);
    expression = _replaceDivision(expression);
    expression = _replacePorcentage(expression);
    expression = _replaceNegativeNumberFlag(expression);
    return expression;
  }

  String _replaceNegativeNumberFlag(String expression) {
    return expression.replaceAll(BasicExpressionUtil.NEGATIVE_NUM_FLAG, '-');
  }

  String _insertSpacesBetweenOperators(String expression) {
    final charList = expression.split('');
    for (var i = 0; i < charList.length; i++) {
      if (BasicExpressionUtil.basicOperators.contains(charList[i]) &&
          charList[i - 1] != ' ') {
        final expr1 = expression.substring(0, i);
        final expr2 = expression.substring(i + 1);
        expression = '$expr1 ${charList[i]} $expr2';
      }
    }
    return expression;
  }

  String _replacePorcentage(String expression) {
    return expression.replaceAll('%', ' % de ');
  }

  String _replaceDivision(String expression) {
    return expression.replaceAll('/', '÷');
  }

  void togglePlusMinus() {
    if (_lastInsertedNumberHasMinus()) {
      _togglePlus();
    } else {
      _toggleMinus();
    }
    updateState();
  }

  void clearLine() {
    expression = '';
    state = DisplayState.empty();
  }

  bool _lastInsertedNumberHasMinus() {
    if (isAllNumber(expression)) {
      return expression.contains(BasicExpressionUtil.NEGATIVE_NUM_FLAG);
    } else {
      final index = _getLastNumberFirstCharIndex(expression);
      final String lastNumber = expression.substring(index);
      return lastNumber.contains(BasicExpressionUtil.NEGATIVE_NUM_FLAG);
    }
  }

  void _toggleMinus() {
    if (expression.length == 0) return;
    if (isAllNumber(expression)) {
      expression = '${BasicExpressionUtil.NEGATIVE_NUM_FLAG}$expression';
    } else {
      final index = _getLastNumberFirstCharIndex(expression);
      final expression1 = expression.substring(0, index);
      final expression2 = expression.substring(index);
      expression =
          '$expression1${BasicExpressionUtil.NEGATIVE_NUM_FLAG}$expression2';
    }
  }

  void _togglePlus() {
    final index = expression.lastIndexOf(BasicExpressionUtil.NEGATIVE_NUM_FLAG);
    final expression1 = expression.substring(0, index);
    final expression2 = expression.substring(index + 1);
    expression = expression1 + expression2;
  }

  int _getLastNumberFirstCharIndex(String expression) {
    var index = -1;
    final charList = expression.split("").reversed.toList();

    for (var i = 0; i < charList.length; i++) {
      index = i;
      if (!isNumberOrPointChar(charList[i])) {
        break;
      }
    }

    return expression.length - index;
  }
}
