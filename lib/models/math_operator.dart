enum MathOperator {
  addition,
  substraction,
  multiplication,
  division,
  percentage,
  squareRoot,
}

const Map<String, MathOperator> mathOperatorMap = {
  '+': MathOperator.addition,
  '-': MathOperator.substraction,
  'x': MathOperator.multiplication,
  '/': MathOperator.division,
  '%': MathOperator.percentage,
  '\u221a': MathOperator.squareRoot,
};

final Map<MathOperator, String> mathOperatorStringMap =
    mathOperatorMap.map((k, v) => MapEntry(v, k));
