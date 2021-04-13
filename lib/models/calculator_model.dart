import 'dart:math';
import 'package:calcunice/models/basic_expression_util.dart';
import 'package:calcunice/models/math_operator.dart';

class CalculatorModel with BasicExpressionUtil {
  const CalculatorModel(this.expression);

  static const precisionDecimalPoint = 11;

  final String expression;

  double getResult() => processMathExpression(expression);

  double processMathExpression(String expression) {
    // TODO(Lucho): En case de ) ( sin operacion o parentesis y despues número squareRoot
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
      final simpleExpression = findNextSingleExpression(expression);
      final simpleExpressionResult =
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
    final mathOperatorString = mathOperatorStringMap[mathOperator]!;
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
          .join();
    }
    return allLeftSideChars.join();
  }

  String _getRightSideStringFromMo(String expression, String mathOperator) {
    final allRightSideChars =
        expression.substring(expression.indexOf(mathOperator) + 1).split('');
    if (_checkHasMathOperator(allRightSideChars)) {
      return allRightSideChars
          .sublist(0, _getIndexOfNextMathOperator(allRightSideChars))
          .join();
    }
    return allRightSideChars.join();
  }

  String replaceExpressionWithResult(
      String expression, String simpleExpression, double result) {
    var stringResult = result.toString();
    if (result < 0) {
      stringResult = '${BasicExpressionUtil.negativeNumberFlag}${result.abs()}';
    }
    return expression.replaceFirst(simpleExpression, stringResult);
  }

  int qtyMathOperators(String expression) {
    var qtyMathOperators = 0;
    final expressionList = expression.split('');
    for (final char in expressionList) {
      if (mathOperatorMap.keys.contains(char)) {
        qtyMathOperators++;
      }
    }
    return qtyMathOperators;
  }

  double resolveSimpleStringExpression(String expression) {
    for (final mathOperatorString in mathOperatorMap.keys) {
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
    final mathOperator = mathOperatorMap[mathOperatorString]!;
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
        // TODO(Lucho): Validate rightSide > 0 or throw error.
        return sqrt(rightSide);
      // ignore: no_default_cases
      default:
        throw UnimplementedError(
            'Ocurrió un error calculando: $leftSideString $mathOperatorString $rightSideString');
    }
  }

  MathOperator _getNextMathOperator(String expression) {
    final sqrtOperator = _getSqrtOperator(expression);
    if (sqrtOperator != null) {
      return sqrtOperator;
    }
    final percentageOperator = _getPercentajeOperator(expression);
    if (percentageOperator != null) {
      return percentageOperator;
    }
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

    if (multiOperator == -1 && divisionIndex == -1) {
      return null;
    }

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
    final additionIndex =
        expression.indexOf(mathOperatorStringMap[MathOperator.addition]!);
    final subtractionIndex =
        expression.indexOf(mathOperatorStringMap[MathOperator.substraction]!);

    if (subtractionIndex == -1 && additionIndex == -1) {
      return null;
    }

    if (additionIndex != -1 && subtractionIndex == -1) {
      return MathOperator.addition;
    }
    if (subtractionIndex != -1 && additionIndex == -1) {
      return MathOperator.substraction;
    }
    return additionIndex < subtractionIndex
        ? MathOperator.addition
        : MathOperator.substraction;
  }

  int _getIndexOfNextMathOperator(List<String> expression) {
    var nextIndex = -1;
    for (final mathOperatorString in mathOperatorMap.keys) {
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
    for (final mathOperator in mathOperatorMap.keys) {
      if (listChar.contains(mathOperator)) {
        return true;
      }
    }
    return false;
  }

  int getIndexOfLastMathOperator(List<String> listChar) {
    var lastIndex = 0;
    for (final mathOperator in mathOperatorMap.keys) {
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
    if (!_expressionHasParenthesis(expression)) {
      throw Exception('$expression must have opening and closing parenthesis.');
    }

    final charList = expression.split('');
    var open = 0;
    var close = 0;

    for (var i = 0; i < charList.length; i++) {
      final char = charList[i];
      if (char != '(' && char != ')') {
        continue;
      }
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
