enum MathOperator {
  addition,
  substraction,
  multiplication,
  division,
}

const Map<String, MathOperator> mathOperatorMap = {
  '+': MathOperator.addition,
  '-': MathOperator.substraction,
  'x': MathOperator.multiplication,
  '/': MathOperator.division,
};

final Map<MathOperator, String> mathOperatorStringMap =
    mathOperatorMap.map((k, v) => MapEntry(v, k));
