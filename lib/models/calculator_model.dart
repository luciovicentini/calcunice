import 'package:calcunice/models/basic_expression_util.dart';
import 'package:calcunice/models/math_operator.dart';
import 'dart:math';

class CalculatorModel with BasicExpressionUtil {
  static const precisionDecimalPoint = 11;

  const CalculatorModel(this.expression);

  final String expression;

  double getResult() => processMathExpression(this.expression);

  double processMathExpression(String expression) {
    if (_expressionHasParenthesis(expression)) {
      final expressionParen = getExpressionBetweenParenthesis(expression);
      var expressionParentResult = 0.0;
      if (qtyMathOperators(expressionParen) == 0) {
        expressionParentResult = double.parse(expressionParen);
      } else {
        expressionParentResult = processMathExpression(expressionParen);
      }
      expression = replaceExpressionWithResult(
          expression, '($expressionParen)', expressionParentResult);
    } else {
      final String simpleExpression = findNextSingleExpression(expression);
      final double simpleExpressionResult =
          resolveSimpleStringExpression(simpleExpression);
      expression = replaceExpressionWithResult(
          expression, simpleExpression, simpleExpressionResult);
    }
    if (qtyMathOperators(expression) == 0) {
      return double.parse(parseNegativeNumFlag(expression));
    } else {
      return processMathExpression(expression);
    }
  }

  String getExpressionBetweenParenthesis(String expression) {
    final openParenIndex = expression.indexOf('(');
    final closeParenIndex = _indexNextClosingParenthesis(expression);
    return expression.substring(openParenIndex + 1, closeParenIndex);
  }

  String findNextSingleExpression(String expression) {
    final mathOperator = _getNextMathOperator(expression);
    final String mathOperatorString = mathOperatorStringMap[mathOperator]!;
    final leftSideString =
        _getLeftSideStringFromMO(expression, mathOperatorString);
    final rightSideString =
        _getRightSideStringFromMo(expression, mathOperatorString);
    return leftSideString + mathOperatorString + rightSideString;
  }

  String _getLeftSideStringFromMO(String expression, String mathOperator) {
    final allLeftSideChars =
        expression.substring(0, expression.indexOf(mathOperator)).split('');
    if (_checkHasMathOperator(allLeftSideChars)) {
      return allLeftSideChars
          .sublist(getIndexOfLastMathOperator(allLeftSideChars) + 1)
          .join('');
    }
    return allLeftSideChars.join('');
  }

  String _getRightSideStringFromMo(String expression, String mathOperator) {
    final allRightSideChars =
        expression.substring(expression.indexOf(mathOperator) + 1).split('');
    if (_checkHasMathOperator(allRightSideChars)) {
      return allRightSideChars
          .sublist(0, _getIndexOfNextMathOperator(allRightSideChars))
          .join('');
    }
    return allRightSideChars.join('');
  }

  String replaceExpressionWithResult(
      String expression, String simpleExpression, double result) {
    var stringResult = result.toString();
    if (result < 0) {
      stringResult = '${BasicExpressionUtil.NEGATIVE_NUM_FLAG}${result.abs()}';
    }
    return expression.replaceFirst(simpleExpression, stringResult);
  }

  int qtyMathOperators(String expression) {
    var qtyMathOperators = 0;
    final expressionList = expression.split('');
    for (var char in expressionList) {
      if (mathOperatorMap.keys.contains(char)) {
        qtyMathOperators++;
      }
    }
    return qtyMathOperators;
  }

  double resolveSimpleStringExpression(String expression) {
    for (var mathOperatorString in mathOperatorMap.keys) {
      if (expression.contains(mathOperatorString)) {
        final numbersList = expression.split(mathOperatorString);
        return resolveSimpleExpression(
            numbersList[0], mathOperatorString, numbersList[1]);
      }
    }
    throw UnimplementedError(
        'Expression {$expression} has a math operator not implemented yet.');
  }

  double resolveSimpleExpression(String leftSideString,
      String mathOperatorString, String rightSideString) {
    final MathOperator mathOperator = mathOperatorMap[mathOperatorString]!;
    var leftSide = 0.0;
    if (mathOperator != MathOperator.squareRoot) {
      leftSide = double.parse(parseNegativeNumFlag(leftSideString));
    }
    final rightSide = double.parse(parseNegativeNumFlag(rightSideString));

    switch (mathOperator) {
      case MathOperator.addition:
        return leftSide + rightSide;
      case MathOperator.substraction:
        return leftSide - rightSide;
      case MathOperator.multiplication:
        return leftSide * rightSide;
      case MathOperator.division:
        if (leftSide == 0 || rightSide == 0) {
          return 0;
        }
        return leftSide / rightSide;
      case MathOperator.percentage:
        return (leftSide * rightSide) / 100;
      case MathOperator.squareRoot:
        return sqrt(rightSide);
      default:
        throw UnimplementedError(
            'Ocurrió un error calculando: $leftSideString $mathOperatorString $rightSideString');
    }
  }

  MathOperator _getNextMathOperator(String expression) {
    final sqrtOperator = _getSqrtOperator(expression);
    if (sqrtOperator != null) return sqrtOperator;
    final percentageOperator = _getPercentajeOperator(expression);
    if (percentageOperator != null) return percentageOperator;
    final multiDivOperator = _getNextMultiOrDivOperator(expression);
    if (multiDivOperator != null) {
      return multiDivOperator;
    }
    final addSubOperator = _getNextAddOrSubOperator(expression);
    if (addSubOperator != null) {
      return addSubOperator;
    }
    throw UnimplementedError();
  }

  MathOperator? _getSqrtOperator(String expression) {
    final sqrtOperatorIndex =
        expression.indexOf(mathOperatorStringMap[MathOperator.squareRoot]!);
    if (sqrtOperatorIndex != -1) {
      return MathOperator.squareRoot;
    }
    return null;
  }

  MathOperator? _getPercentajeOperator(String expression) {
    final percentagetOperatorIndex =
        expression.indexOf(mathOperatorStringMap[MathOperator.percentage]!);
    if (percentagetOperatorIndex != -1) {
      return MathOperator.percentage;
    }
    return null;
  }

  MathOperator? _getNextMultiOrDivOperator(String expression) {
    final multiOperator =
        expression.indexOf(mathOperatorStringMap[MathOperator.multiplication]!);
    final divisionIndex =
        expression.indexOf(mathOperatorStringMap[MathOperator.division]!);

    if (multiOperator == -1 && divisionIndex == -1) return null;

    if (divisionIndex != -1 && multiOperator == -1) {
      return MathOperator.division;
    }
    if (multiOperator != -1 && divisionIndex == -1) {
      return MathOperator.multiplication;
    }

    return multiOperator < divisionIndex
        ? MathOperator.multiplication
        : MathOperator.division;
  }

  MathOperator? _getNextAddOrSubOperator(String expression) {
    final additionIndex = expression
        .indexOf(mathOperatorStringMap[MathOperator.addition] as String);
    final substractionIndex = expression
        .indexOf(mathOperatorStringMap[MathOperator.substraction] as String);

    if (substractionIndex == -1 && additionIndex == -1) return null;

    if (additionIndex != -1 && substractionIndex == -1) {
      return MathOperator.addition;
    }
    if (substractionIndex != -1 && additionIndex == -1) {
      return MathOperator.substraction;
    }
    return additionIndex < substractionIndex
        ? MathOperator.addition
        : MathOperator.substraction;
  }

  int _getIndexOfNextMathOperator(List<String> expression) {
    var nextIndex = -1;
    for (var mathOperatorString in mathOperatorMap.keys) {
      final index = expression.indexOf(mathOperatorString);
      if (index > 0) {
        if (nextIndex == -1 || index < nextIndex) {
          nextIndex = index;
        }
      }
    }
    return nextIndex;
  }

  bool _checkHasMathOperator(List<String> listChar) {
    for (var mathOperator in mathOperatorMap.keys) {
      if (listChar.contains(mathOperator)) {
        return true;
      }
    }
    return false;
  }

  int getIndexOfLastMathOperator(List<String> listChar) {
    var lastIndex = 0;
    for (var mathOperator in mathOperatorMap.keys) {
      if (listChar.contains(mathOperator)) {
        final index = listChar.lastIndexOf(mathOperator);
        if (lastIndex == 0 || index > lastIndex) {
          lastIndex = index;
        }
      }
    }
    return lastIndex;
  }

  bool _expressionHasParenthesis(String expression) =>
      expression.contains('(') || expression.contains(')');

  int _indexNextClosingParenthesis(String expression) {
    if (!_expressionHasParenthesis(expression))
      throw Exception('$expression must have opening and closing parenthesis.');

    final charList = expression.split('');
    var open = 0;
    var close = 0;

    for (var i = 0; i < charList.length; i++) {
      final char = charList[i];
      if (char != '(' && char != ')') continue;
      if (char == ('(')) {
        open++;
      }
      if (char == (')')) {
        close++;
      }
      if (char == ')' && open == close) {
        return i;
      }
    }
    return -1;
  }
}
