import 'package:calcunice/models/basic_expression_util.dart';
import 'package:calcunice/models/button_action.dart';
import 'package:calcunice/models/expression.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DisplayModel extends StateNotifier<String>
    with Expression, BasicExpressionUtil {
  DisplayModel() : super('');

  String get line => parseExpression(this.expression);

  void onButtonTap(ButtonAction action) {
    super.onButtonTap(action);
    updateState();
  }

  void updateState() {
    state = parseExpression(expression);
  }

  String parseExpression(String expression) {
    return expression.replaceAll(Expression.NEGATIVE_NUM_FLAG, '-');
  }

  void togglePlusMinus() {
    if (lastInsertedNumberHasMinus()) {
      togglePlus();
    } else {
      toggleMinus();
    }
    updateState();
  }

  void clearLine() {
    state = '';
  }

  bool lastInsertedNumberHasMinus() {
    if (isAllNumber(expression)) {
      return expression.contains(Expression.NEGATIVE_NUM_FLAG);
    } else {
      final index = _getLastNumberFirstCharIndex(expression);
      final String lastNumber = expression.substring(index);
      return lastNumber.contains(Expression.NEGATIVE_NUM_FLAG);
    }
  }

  void toggleMinus() {
    if (expression.length == 0) return;
    if (isAllNumber(expression)) {
      expression = '${Expression.NEGATIVE_NUM_FLAG}$expression';
    } else {
      final index = _getLastNumberFirstCharIndex(expression);
      final expression1 = expression.substring(0, index);
      final expression2 = expression.substring(index);
      expression = '$expression1${Expression.NEGATIVE_NUM_FLAG}$expression2';
    }
  }

  void togglePlus() {
    final index = expression.lastIndexOf(Expression.NEGATIVE_NUM_FLAG);
    final expression1 = expression.substring(0, index);
    final expression2 = expression.substring(index + 1);
    expression = expression1 + expression2;
  }

  int _getLastNumberFirstCharIndex(String expression) {
    var index = -1;
    final charList = expression.split("").reversed.toList();

    for (var i = 0; i < charList.length; i++) {
      index = i;
      if (isNumberExtended(charList[i])) {
        break;
      }
    }

    return expression.length - index;
  }
}
