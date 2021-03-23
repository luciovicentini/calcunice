import 'package:calcunice/models/math_expression.dart';
import 'package:calcunice/models/math_operator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('-------- Testing MathExpression.getNextMathOperator() --------', () {
    final expression = MathExpression(expression: '');
    expect(expression.getNextMathOperator('1231232/2-1x3/3'),
        MathOperator.division);
  });

  test('-------- Testing MathExpression.getNextMathOperator() --------', () {
    final expression = MathExpression(expression: '');
    expect(expression.getNextMathOperator('12x232-1132x333/3'),
        MathOperator.multiplication);
  });

  test('-------- Testing MathExpression.getNextMathOperator() --------', () {
    final expression = MathExpression(expression: '');
    expect(
        expression.getNextMathOperator('1+2+3-4-1-5'), MathOperator.addition);
  });

  test('-------- Testing MathExpression.getNextMathOperator() --------', () {
    final expression = MathExpression(expression: '');
    expect(expression.getNextMathOperator('123-241+31-43-122-544'),
        MathOperator.substraction);
  });

  test('-------- Testing MathExpression.resolveSimpleExpression() --------',
      () {
    final expression = MathExpression(expression: '');
    expect(expression.resolveSimpleExpression('123', '+', '142'), 265);
  });

  test('-------- Testing MathExpression.resolveSimpleExpression() --------',
      () {
    final expression = MathExpression(expression: '');
    expect(expression.resolveSimpleExpression('400', '-', '1000'), -600);
  });

  test('-------- Testing MathExpression.resolveSimpleExpression() --------',
      () {
    final expression = MathExpression(expression: '');
    expect(expression.resolveSimpleExpression('40', 'x', '23'), 920);
  });

  test('-------- Testing MathExpression.resolveSimpleExpression() --------',
      () {
    final expression = MathExpression(expression: '');
    expect(expression.resolveSimpleExpression('40', '/', '2'), 20);
  });

  test(
      '-------- Testing MathExpression.resolveSimpleStringExpression() --------',
      () {
    final expression = MathExpression(expression: '');
    expect(expression.resolveSimpleStringExpression('123+142'), 265);
  });

  test(
      '-------- Testing MathExpression.resolveSimpleStringExpression() --------',
      () {
    final expression = MathExpression(expression: '');
    expect(expression.resolveSimpleStringExpression('400-1000'), -600);
  });

  test(
      '-------- Testing MathExpression.resolveSimpleStringExpression() --------',
      () {
    final expression = MathExpression(expression: '');
    expect(expression.resolveSimpleStringExpression('40x23'), 920);
  });

  test(
      '-------- Testing MathExpression.resolveSimpleStringExpression() --------',
      () {
    final expression = MathExpression(expression: '');
    expect(expression.resolveSimpleStringExpression('40/2'), 20);
  });

  test('-------- Testing MathExpression.qtyMathOperators() --------', () {
    final expression = MathExpression(expression: '');
    expect(expression.qtyMathOperators('1231232/2-1x3/3'), 4);
  });

  test('-------- Testing MathExpression.qtyMathOperators() --------', () {
    final expression = MathExpression(expression: '');
    expect(expression.qtyMathOperators('1231232/2'), 1);
  });

  test('-------- Testing MathExpression.qtyMathOperators() --------', () {
    final expression = MathExpression(expression: '');
    expect(expression.qtyMathOperators('12x232-1132x333/3'), 4);
  });

  test('-------- Testing MathExpression.qtyMathOperators() --------', () {
    final expression = MathExpression(expression: '');
    expect(expression.qtyMathOperators('1+2+3-4-1-5'), 5);
  });

  test('-------- Testing MathExpression.findNextSingleExpression() --------',
      () {
    final expression = MathExpression(expression: '');
    expect(expression.findNextSingleExpression('1+2+3-4-1-5'), '1+2');
  });

  test('-------- Testing MathExpression.findNextSingleExpression() --------',
      () {
    final expression = MathExpression(expression: '');
    expect(expression.findNextSingleExpression('12x232-1132x333/3'), '12x232');
  });

  test('-------- Testing MathExpression.findNextSingleExpression() --------',
      () {
    final expression = MathExpression(expression: '');
    expect(expression.findNextSingleExpression('40x2-80/423'), '40x2');
  });

  test('-------- Testing MathExpression.findNextSingleExpression() --------',
      () {
    final expression = MathExpression(expression: '');
    expect(expression.findNextSingleExpression('4+44/4+40/4'), '44/4');
  });

  test('-------- Testing MathExpression.findNextSingleExpression() --------',
      () {
    final expression = MathExpression(expression: '');
    expect(expression.findNextSingleExpression('4+44-4+40x423'), '40x423');
  });

  test('-------- Testing MathExpression.processMathExpression() --------', () {
    final expression = MathExpression(expression: '');
    expect(expression.processMathExpression('4+44-4+40x423'), 16964);
  });

  test('-------- Testing MathExpression.processMathExpression() --------', () {
    final expression = MathExpression(expression: '');
    expect(expression.processMathExpression('40x2-80/423'), 79.81087470449172);
  });

  test('-------- Testing MathExpression.processMathExpression() --------', () {
    final expression = MathExpression(expression: '');
    expect(expression.processMathExpression('40/0'), 0);
  });

  test(
      '-------- Testing MathExpression.getExpressionBetweenParenthesis() --------',
      () {
    final expression = MathExpression(expression: '');
    expect(expression.getExpressionBetweenParenthesis('(4+5x(3+1))x4/(3+1)'),
        '4+5x(3+1)');
  });
}
