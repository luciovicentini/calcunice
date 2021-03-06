import 'package:calcunice/models/basic_expression_util.dart';
import 'package:calcunice/models/button_action.dart';
import 'package:calcunice/states/display_state.dart';
import 'package:calcunice/models/math_operator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:calcunice/extension_function.dart';

class DisplayModel extends StateNotifier<DisplayState>
    with BasicExpressionUtil {
  DisplayModel() : super(const DisplayState.empty());

  String expression = '';

  String getDisplay() => state.when(
        empty: () => '',
        expression: (expression) => expression,
      );

  bool onButtonTap(ButtonAction action, String? result) {
    final shouldGetResult = _handleButtonAction(action, result);
    updateState();
    return shouldGetResult;
  }

  bool _handleButtonAction(ButtonAction action, String? result) {
    var shouldGetResult = false;
    switch (action) {
      case ButtonAction.equals:
        if (_isValidExpression()) {
          expression = _closeOpenedParenthesis(expression);
          shouldGetResult = true;
        }
        break;
      case ButtonAction.one:
        _addMultiplicationIfNeeded();
        expression += '1';
        break;
      case ButtonAction.two:
        _addMultiplicationIfNeeded();
        expression += '2';
        break;
      case ButtonAction.three:
        _addMultiplicationIfNeeded();
        expression += '3';
        break;
      case ButtonAction.four:
        _addMultiplicationIfNeeded();
        expression += '4';
        break;
      case ButtonAction.five:
        _addMultiplicationIfNeeded();
        expression += '5';
        break;
      case ButtonAction.six:
        _addMultiplicationIfNeeded();
        expression += '6';
        break;
      case ButtonAction.seven:
        _addMultiplicationIfNeeded();
        expression += '7';
        break;
      case ButtonAction.eight:
        _addMultiplicationIfNeeded();
        expression += '8';
        break;
      case ButtonAction.nine:
        _addMultiplicationIfNeeded();
        expression += '9';
        break;
      case ButtonAction.zero:
        _addMultiplicationIfNeeded();
        expression += '0';
        break;
      case ButtonAction.point:
        if (!_isLastNumberDecimal()) {
          if (_isFirstChar()) {
            expression += '0';
          }
          expression += '.';
        }
        break;
      case ButtonAction.backspace:
        expression = expression.substring(0, expression.length - 1);
        break;
      case ButtonAction.addition:
        if (_isLastCharMathOperator(expression)) {
          expression = _replaceLastMathOperator(expression, '+');
        } else {
          if (expression.isNotEmpty && !_lastCharIsOpenPar(expression)) {
            expression += '+';
          } else if (expression.isEmpty && result != null) {
            expression = '$result+';
          }
        }
        break;
      case ButtonAction.substraction:
        if (_isLastCharMathOperator(expression)) {
          expression = _replaceLastMathOperator(expression, '-');
        } else {
          if (expression.isNotEmpty && !_lastCharIsOpenPar(expression)) {
            expression += '-';
          } else if (expression.isEmpty && result != null) {
            expression = '$result-';
          }
        }
        break;
      case ButtonAction.multiplication:
        if (_isLastCharMathOperator(expression)) {
          expression = _replaceLastMathOperator(expression, 'x');
        } else {
          if (expression.isNotEmpty && !_lastCharIsOpenPar(expression)) {
            expression += 'x';
          } else if (expression.isEmpty && result != null) {
            expression = '${result}x';
          }
        }
        break;
      case ButtonAction.division:
        if (_isLastCharMathOperator(expression)) {
          expression = _replaceLastMathOperator(expression, '/');
        } else {
          if (expression.isNotEmpty && !_lastCharIsOpenPar(expression)) {
            expression += '/';
          } else if (expression.isEmpty && result != null) {
            expression = '$result/';
          }
        }
        break;
      case ButtonAction.squareRoot:
        if (expression.isEmpty && result != null) {
          expression = '√($result';
        } else {
          expression += '√(';
        }
        break;
      case ButtonAction.clearScreen:
        expression = '';
        break;
      case ButtonAction.openParenthesis:
        expression += '(';
        break;
      case ButtonAction.closeParenthesis:
        if (!_lastCharIsOpenPar(expression)) {
          if (_canCloseParenthesis()) {
            expression += ')';
          }
        }
        break;
      case ButtonAction.percentage:
        if (_isLastCharMathOperator(expression)) {
          expression = _replaceLastMathOperator(expression, '%');
        } else {
          if (!_lastCharIsOpenPar(expression)) {
            expression += '%';
          }
        }
        break;
      case ButtonAction.plusMinusToggle:
        togglePlusMinus();
        break;
      case ButtonAction.clearHistoricList:
        break;
      default:
        throw UnimplementedError('Button Action = $action not implemented yet');
    }
    return shouldGetResult;
  }

  bool _isValidExpression() {
    var isValidExpression = false;
    isValidExpression = !_isLastCharMathOperator(expression);
    isValidExpression = _hasAtLeastOneOperator(expression);
    return isValidExpression;
  }

  void _addMultiplicationIfNeeded() {
    if (_lastCharIsClosePar(expression)) {
      expression += 'x';
    }
  }

  void updateState() {
    if (expression.isNotEmpty) {
      state = DisplayState.expression(_parseExpression(expression));
    } else {
      state = const DisplayState.empty();
    }
  }

  void togglePlusMinus() {
    if (_lastInsertedNumberHasMinus()) {
      _togglePlus();
    } else {
      _toggleMinus();
    }
    updateState();
  }

  void setResult(String result) {
    expression = result;
    updateState();
  }

  String _parseExpression(String expression) {
    var exp = expression;
    exp = _insertSpacesBetweenOperators(exp);
    exp = _replaceDivision(exp);
    exp = _replacePorcentage(exp);
    exp = _replaceNegativeNumberFlag(exp);
    return exp;
  }

  String _replaceNegativeNumberFlag(String expression) =>
      expression.replaceAll(BasicExpressionUtil.negativeNumberFlag, '-');

  String _insertSpacesBetweenOperators(String expression) {
    final charList = expression.split('');
    var finalExpression = '';
    for (var i = 0; i < charList.length; i++) {
      if (BasicExpressionUtil.basicOperators.contains(charList[i])) {
        finalExpression += ' ';
        finalExpression += charList[i];
        finalExpression += ' ';
      } else {
        finalExpression += charList[i];
      }
    }
    return finalExpression;
  }

  String _replacePorcentage(String expression) =>
      expression.replaceAll('%', ' % de ');

  String _replaceDivision(String expression) => expression.replaceAll('/', '÷');

  bool _isLastNumberDecimal() => _getLastNumber().contains('.');

  String _getLastNumber() {
    if (isAllNumber(expression)) {
      return expression;
    }
    final index = _getLastNumberFirstCharIndex(expression);
    return expression.substring(index);
  }

  bool _lastInsertedNumberHasMinus() =>
      _getLastNumber().contains(BasicExpressionUtil.negativeNumberFlag);

  void _toggleMinus() {
    if (expression.isEmpty) {
      return;
    }
    if (isAllNumber(expression)) {
      expression = '${BasicExpressionUtil.negativeNumberFlag}$expression';
    } else {
      final index = _getLastNumberFirstCharIndex(expression);
      final expression1 = expression.substring(0, index);
      final expression2 = expression.substring(index);
      expression =
          '$expression1${BasicExpressionUtil.negativeNumberFlag}$expression2';
    }
  }

  void _togglePlus() {
    final index =
        expression.lastIndexOf(BasicExpressionUtil.negativeNumberFlag);
    final expression1 = expression.substring(0, index);
    final expression2 = expression.substring(index + 1);
    expression = expression1 + expression2;
  }

  int _getLastNumberFirstCharIndex(String expression) {
    var index = -1;
    final charList = expression.split('').reversed.toList();

    for (var i = 0; i < charList.length; i++) {
      index = i;
      if (!isNumberOrPointChar(charList[i])) {
        break;
      }
    }

    return expression.length - index;
  }

  bool _canCloseParenthesis() {
    final openParenthesis = getAmountOfOpeningParenthesis(expression);
    final closeParenthesis = getAmountOfClosingParenthesis(expression);
    return openParenthesis > closeParenthesis;
  }

  bool _isLastCharMathOperator(String expression) {
    if (expression.isEmpty) {
      return false;
    }
    final lastChar = expression.split('').last;
    return mathOperatorMap.keys.contains(lastChar);
  }

  bool _hasAtLeastOneOperator(String expression) {
    if (expression.isEmpty) {
      return false;
    }
    final listExp = expression.split('');
    for (final char in listExp) {
      if (mathOperatorMap.keys.contains(char)) {
        return true;
      }
    }
    return false;
  }

  bool _isLastCharParenthesis(String expression) {
    if (expression.isEmpty) {
      return false;
    }
    final lastChar = expression.split('').last;
    return lastChar == '(' || lastChar == ')';
  }

  bool _lastCharIsOpenPar(String expression) {
    if (expression.isEmpty) {
      return false;
    }
    final lastChar = expression.split('').last;
    return lastChar == '(';
  }

  bool _lastCharIsClosePar(String expression) {
    if (expression.isEmpty) {
      return false;
    }
    final lastChar = expression.split('').last;
    return lastChar == ')';
  }

  String _replaceLastMathOperator(String expression, String operator) {
    var exp = expression;
    exp = exp.substring(0, expression.length - 1);
    exp += operator;
    return expression;
  }

  bool _isFirstChar() =>
      expression.isEmpty || _isLastCharMathOperatorOrParenthesis();

  bool _isLastCharMathOperatorOrParenthesis() =>
      _isLastCharMathOperator(expression) || _isLastCharParenthesis(expression);

  String _closeOpenedParenthesis(String expression) {
    final exp = StringBuffer(expression);
    final openedParenthesis = getAmountOfOpeningParenthesis(expression);
    final closedParenthesis = getAmountOfClosingParenthesis(expression);
    if (openedParenthesis > closedParenthesis) {
      for (var i = 0; i < openedParenthesis - closedParenthesis; i++) {
        exp.write(')');
      }
    }
    return exp.toString();
  }

  void useResultOfExpression(String selectedExpression) {
    final result = selectedExpression.getResult();

    if (expression.isEmpty) {
      expression = parseResultToExpression(result);
      updateState();
    } else if (!BasicExpressionUtil.numbersPointList
        .contains(expression.split('').last)) {
      expression += parseResultToExpression(result);
      updateState();
    }
  }
}
