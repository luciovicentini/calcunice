import 'math_expression.dart';

class Calculator {
  final String mathExpressionString;
  final MathExpression mathExpression;

  Calculator(this.mathExpressionString)
      : this.mathExpression = MathExpression.fromString(mathExpressionString);

  double get getResult => mathExpression.getResult();
}
