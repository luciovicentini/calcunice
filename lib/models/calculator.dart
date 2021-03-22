import 'math_expression.dart';

class Calculator {
  static const precisionDecimalPoint = 11;
  final String mathExpressionString;
  final MathExpression mathExpression;

  Calculator(this.mathExpressionString)
      : this.mathExpression = MathExpression.fromString(mathExpressionString);

  double get getResult => double.parse(
      mathExpression.getResult().toStringAsFixed(precisionDecimalPoint));
}
