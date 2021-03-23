// import 'math_expression.dart';

import 'package:calcunice/models/math_expression.dart';

class Calculator {
  static const precisionDecimalPoint = 11;
  final String mathExpressionString;

  Calculator(this.mathExpressionString);

  double getResult() =>
      MathExpression(expression: this.mathExpressionString).result;
}
