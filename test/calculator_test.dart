import 'package:calcunice/models/calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testCalculator('1+2+3+4', 10);
  testCalculator('1+2+3-4', 2);
  testCalculator('2-4+3-4', -3);
  testCalculator('3x3+2', 11);
  testCalculator('9/3+2', 5);
  testCalculator('9x3/2', 13.5);
  testCalculator('6/5x0', 0);
  testCalculator('0/5x0', 0);
  testCalculator('3+2x3/4-3.5+31.42', 32.42);
  testCalculator('5.3234/3.4123', 1.560062128183337);
  testCalculator('8/2+2', 6);
  testCalculator('8/(2+2)', 2);
  testCalculator('(8+2)/2', 5);
  testCalculator('4x(8-4)/2', 8);
  testCalculator('(4+5)x4/(3+1)', 9);
  testCalculator('(4+5x(3+1))x4/(3+1)', 24);
}

void testCalculator(String testExpression, double result) {
  test('-------- Expression: $testExpression should return $result --------',
      () {
    final calcu = Calculator(testExpression);
    expect(calcu.getResult(), result);
  });
}
