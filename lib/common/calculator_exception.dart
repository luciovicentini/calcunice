class CalculatorException implements Exception {
  CalculatorException(this.cause);
  final String cause;

  @override
  String toString() => 'CalculatorException{cause: $cause}';
}
