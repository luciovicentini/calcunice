import 'dart:math';
import 'package:calcunice/common/calculator_exception.dart';
import 'package:calcunice/models/basic_expression_util.dart';
import 'package:calcunice/models/math_operator.dart';
import 'package:decimal/decimal.dart';

class CalculatorModel with BasicExpressionUtil {
  const CalculatorModel(this.expressionField);

  static const precisionDecimalPoint = 11;

  final String expressionField;

  double getResult() => processMathExpression(expressionField);

  String getStringResult() {
    final result = getResult();
    if (_isInteger(result)) {
      return result.toStringAsFixed(0);
    } else {
      return _dp(result, 8).toString();
    }
  }

  double processMathExpression(String expression) {
    var tempExp = parseExpressionBeforeCalculations(expression);

    if (_expressionHasParenthesis(tempExp)) {
      final expressionParen = getExpressionBetweenParenthesis(tempExp);
      var expressionParentResult = 0.0;
      if (qtyMathOperators(expressionParen) == 0) {
        expressionParentResult =
            double.parse(parseNegativeNumFlag(expressionParen));
      } else {
        expressionParentResult = processMathExpression(expressionParen);
      }
      tempExp = _replaceExpressionWithResult(
          tempExp, '($expressionParen)', expressionParentResult);
    } else {
      final simpleExpression = findNextSingleExpression(tempExp);
      final simpleExpressionResult =
          resolveSimpleStringExpression(simpleExpression);
      tempExp = _replaceExpressionWithResult(
          tempExp, simpleExpression, simpleExpressionResult);
    }

    if (qtyMathOperators(tempExp) == 0) {
      final result = double.parse(parseNegativeNumFlag(tempExp));
      return result;
    } else {
      return processMathExpression(tempExp);
    }
  }

  String parseExpressionBeforeCalculations(String expression) {
    var tempExp = _addMultiplicationBetweenParenthesis(expression);
    tempExp = _parseScientificNotation(tempExp);
    tempExp = _addMultiplicationBetweenNumberAndParenthesis(tempExp);
    tempExp = _addMultiplicationBeforeSquareRoot(tempExp);
    return tempExp;
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
          .sublist(_getIndexOfLastMathOperator(allLeftSideChars) + 1)
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

  String _replaceExpressionWithResult(
      String expression, String simpleExpression, double result) {
    var stringResult = result.toString();
    if (result < 0) {
      stringResult = '${BasicExpressionUtil.negativeNumberFlag}${result.abs()}';
    }
    return _replaceExpressionWithStringResult(
        expression, simpleExpression, stringResult);
  }

  String _replaceExpressionWithStringResult(
          String exp, String simpleExp, String result) =>
      exp.replaceFirst(simpleExp, result);

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

  MathOperator _getNextMathOperator(String exp) {
    final sqrtOperator = _getSqrtOperator(exp);
    if (sqrtOperator != null) {
      return sqrtOperator;
    }
    final percentageOperator = _getPercentajeOperator(exp);
    if (percentageOperator != null) {
      return percentageOperator;
    }
    final multiDivOperator = _getNextMultiOrDivOperator(exp);
    if (multiDivOperator != null) {
      return multiDivOperator;
    }
    final addSubOperator = _getNextAddOrSubOperator(exp);
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

  int _getIndexOfLastMathOperator(List<String> listChar) {
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

  bool _isInteger(num value) => value is int || value == value.roundToDouble();

  double _dp(double val, int places) {
    final mod = pow(10.0, places);
    return (val * mod).round().toDouble() / mod;
  }

  String _addMultiplicationBetweenParenthesis(String exp) {
    final expList = exp.split('');
    final expression = StringBuffer();
    for (var i = 0; i < exp.length; i++) {
      final char = expList[i];
      expression.write(char);
      if (char == ')' && i + 1 < exp.length && expList[i + 1] == '(') {
        expression.write('x');
      }
    }

    return expression.toString();
  }

  String _addMultiplicationBetweenNumberAndParenthesis(String exp) {
    final expList = exp.split('');
    final expression = StringBuffer(expList[0]);
    for (var i = 1; i < exp.length; i++) {
      if (expList[i] == '(' && getExtendedNumbers().contains(expList[i - 1])) {
        expression.write('x');
      }
      expression.write(expList[i]);
    }
    return expression.toString();
  }

  String _addMultiplicationBeforeSquareRoot(String exp) {
    final expList = exp.split('');
    final expression = StringBuffer(expList[0]);
    for (var i = 1; i < exp.length; i++) {
      if (isSquareRoot(expList[i]) &&
          (getExtendedNumbers().contains(expList[i - 1]) ||
              isClosingParenthesis(expList[i - 1]))) {
        expression.write('x');
      }
      expression.write(expList[i]);
    }
    return expression.toString();
  }

  bool _hasScientificNotation(String exp) => exp.contains('e');

  String _parseScientificNotation(String exp) {
    var expression = exp;
    while (_hasScientificNotation(expression)) {
      final eExpression = _getNextScientificNotationExpression(expression);
      final eDoubleExpression = Decimal.parse(eExpression).toDouble();
      if ('$eDoubleExpression'.contains('e')) {
        throw CalculatorException(
            '$eDoubleExpression is too big or too small for calculations');
      }
      expression = _replaceExpressionWithResult(
          expression, eExpression, eDoubleExpression);
    }
    return expression;
  }

  String _getNextScientificNotationExpression(String expression) {
    final eIndex = expression.indexOf('e');
    final leftEIndex =
        _getIndexOfLastMathOperator(expression.substring(0, eIndex).split(''));
    final rightEIndex =
        _getIndexOfNextMathOperator(expression.substring(eIndex + 2).split(''));
    return expression
        .substring(leftEIndex != 0 ? leftEIndex + 1 : 0,
            rightEIndex == -1 ? expression.length : eIndex + rightEIndex + 1)
        .trim();
  }
}
