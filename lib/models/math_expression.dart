import 'package:calcunice/models/resultable.dart';

import 'math_number.dart';
import 'math_operator.dart';

class MathExpression with Resultable {
  MathExpression(
      {this.resultableLeft = const MathNumber(0),
      this.mathOperator,
      this.resultableRight = const MathNumber(0)});

  static MathExpression fromString(String expression) {
    final mathExpression = MathExpression();
    mathExpression._parseStringExpression(expression);
    return mathExpression;
  }

  MathOperator? mathOperator;
  Resultable resultableLeft;
  Resultable resultableRight;

  @override
  double getResult() {
    switch (mathOperator) {
      case MathOperator.addition:
        return resultableLeft.getResult() + resultableRight.getResult();
      case MathOperator.substraction:
        return resultableLeft.getResult() - resultableRight.getResult();
      case MathOperator.multiplication:
        return resultableLeft.getResult() * resultableRight.getResult();
      case MathOperator.division:
        return resultableLeft.getResult() / resultableRight.getResult();
      default:
        throw UnimplementedError();
    }
  }

  _parseStringExpression(String expression) {
    final mathOperator = _getNextMathOperator(expression);
    print('$expression -> $mathOperator');
    final listExpression = _subString(expression,
        expression.lastIndexOf(mathOperatorStringMap[mathOperator] as String));

    final left = double.tryParse(listExpression[0]);
    final right = double.tryParse(listExpression[1]);

    this.resultableLeft = left != null
        ? MathNumber(left)
        : MathExpression.fromString(listExpression[0]);
    this.resultableRight = right != null
        ? MathNumber(right)
        : MathExpression.fromString(listExpression[1]);
    this.mathOperator = mathOperator;
  }

  MathOperator? _getNextMathOperator(String expression) {
    final addSubOperator = _getNextAddOrSubOperator(expression);
    if (addSubOperator != null) {
      return addSubOperator;
    }
    final multiDivOperator = _getNextMultiOrDivOperator(expression);
    if (multiDivOperator != null) {
      return multiDivOperator;
    }
    return null;
  }

  MathOperator? _getNextMultiOrDivOperator(String expression) {
    final multiOperator = expression.lastIndexOf(
        mathOperatorStringMap[MathOperator.multiplication] as String);
    final divisionIndex = expression
        .lastIndexOf(mathOperatorStringMap[MathOperator.division] as String);

    if (multiOperator == -1 && divisionIndex == -1) return null;

    if (multiOperator == -1 && divisionIndex != -1) {
      return MathOperator.division;
    }
    if (multiOperator != 1 && divisionIndex == -1) {
      return MathOperator.multiplication;
    }

    return multiOperator > divisionIndex
        ? MathOperator.multiplication
        : MathOperator.division;
  }

  MathOperator? _getNextAddOrSubOperator(String expression) {
    final additionIndex = expression
        .lastIndexOf(mathOperatorStringMap[MathOperator.addition] as String);
    final substractionIndex = expression.lastIndexOf(
        mathOperatorStringMap[MathOperator.substraction] as String);

    if (substractionIndex == -1 && additionIndex == -1) return null;

    if (substractionIndex == -1 && additionIndex != -1) {
      return MathOperator.addition;
    }
    if (additionIndex == -1 && substractionIndex != -1) {
      return MathOperator.substraction;
    }
    return additionIndex > substractionIndex
        ? MathOperator.addition
        : MathOperator.substraction;
  }

  List<String> _subString(String expression, int index) {
    final list = <String>[];
    list.add(expression.substring(0, index));
    list.add(expression.substring(index + 1));
    return list;
  }

  Map<String, dynamic> toJson() => {
        'resultableLeft': resultableLeft.toJson(),
        'mathOperator': mathOperator.toString(),
        'resultableRight': resultableRight.toJson()
      };

  MathExpression.fromJson(Map<String, dynamic> json)
      : resultableLeft = MathNumber(0),
        resultableRight = MathNumber(0);
}
