import 'package:calcunice/models/calculator_model.dart';
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
  testCalculator('8/(4)', 2);
  testCalculator('(8+2)/2', 5);
  testCalculator('4x(8-4)/2', 8);
  testCalculator('(4+5)x4/(3+1)', 9);
  testCalculator('(4+5x(3+1))x4/(3+1)', 24);
  testCalculator('(4+(5x(3+1))x4)/(3+1)', 21);
  testCalculator('(m4x4)/4+4', 0);
  testCalculator('2.6x4.5/6.5+3.44', 5.24);

  testCalculator('20%100', 20);
  testCalculator('20%40', 8);
  testCalculator('20%50%50', 5);
  testCalculator('2+20%40', 10);
  testCalculator('(20+20)%(40x2+20)', 40);
  testCalculator('20+20%40x2+20', 56);

  testCalculator('√(9)', 3);
  testCalculator('√(9x9)', 9);
  testCalculator('10+√(9x9)', 19);
  testCalculator('1+√(81+10-15+5x1)x2', 19);

  testCalculator('123456789123456123123123123123123123123x1',
      123456789123456123123123123123123123123.0);
  testCalculator('123456789123456789 x 123 / 1535 + 50', 9892628705006686);
}

void testCalculator(String testExpression, double result) {
  test('-------- $testExpression should return $result --------', () {
    final calcu = CalculatorModel(testExpression);
    expect(calcu.getResult(), result);
  });
}
