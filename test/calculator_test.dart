import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Expression: 1+1 should return 2', () {
    final calcu = Calculator('1+1');

    expect(calcu.getResult, 2);
  });

  test('Expression: 1+1+1 should return 3', () {
    final calcu = Calculator('1+1+1');

    expect(calcu.getResult, 3);
  });

  const String test3 = '1+2+3+4';
  const double result3 = 10;
  test('Expression: $test3 should return $result3', () {
    final calcu = Calculator(test3);

    expect(calcu.getResult, result3);
  });

  const String test4 = '1+2+3-4';
  const double result4 = 2;
  test('Expression: $test4 should return $result4', () {
    final calcu = Calculator(test4);

    expect(calcu.getResult, result4);
  });

  const String test5 = '2-4+3-4';
  const double result5 = -3;
  test('Expression: $test5 should return $result5', () {
    final calcu = Calculator(test5);
    expect(calcu.getResult, result5);
  });

  const String test6 = '3x3+2';
  const double result6 = 11;
  test('Expression: $test6 should return $result6', () {
    final calcu = Calculator(test6);
    expect(calcu.getResult, result6);
  });

  const String test7 = '9/3+2';
  const double result7 = 5;
  test('Expression: $test7 should return $result7', () {
    final calcu = Calculator(test7);
    expect(calcu.getResult, result7);
  });

  const String test8 = '9x3/2';
  const double result8 = 13.5;
  test('Expression: $test8 should return $result8', () {
    final calcu = Calculator(test8);
    expect(calcu.getResult, result8);
  });
}
