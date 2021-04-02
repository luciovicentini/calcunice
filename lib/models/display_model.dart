import 'package:calcunice/models/basic_expression_util.dart';
import 'package:calcunice/models/button_action.dart';
import 'package:calcunice/models/display_state.dart';
import 'package:calcunice/models/expression.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DisplayModel extends StateNotifier<DisplayState>
    with Expression, BasicExpressionUtil {
  DisplayModel() : super(DisplayState.empty());

  String getExpression() =>
      state.when(empty: () => '', expression: (expression) => expression);

  void onButtonTap(ButtonAction action) {
    super.onButtonTap(action);
    updateState();
  }

  void updateState() {
    state = DisplayState.expression(_parseExpression());
  }

  String _parseExpression() {
    _insertSpacesBetweenOperators();
    expression = expression.replaceAll(Expression.NEGATIVE_NUM_FLAG, '-');
    return expression;
  }

  void _insertSpacesBetweenOperators() {
    final charList = expression.split('');
    for (var i = 0; i < charList.length; i++) {
      if (spacingNeededOperators.contains(charList[i]) &&
          charList[i - 1] != ' ') {
        final expr1 = expression.substring(0, i);
        final expr2 = expression.substring(i + 1);
        expression = '$expr1 ${charList[i]} $expr2';
      }
    }
  }

  void togglePlusMinus() {
    if (_lastInsertedNumberHasMinus()) {
      _togglePlus();
    } else {
      _toggleMinus();
    }
    updateState();
  }

  void clearLine() {
    expression = '';
    state = DisplayState.empty();
  }

  bool _lastInsertedNumberHasMinus() {
    if (isAllNumber(expression)) {
      return expression.contains(Expression.NEGATIVE_NUM_FLAG);
    } else {
      final index = _getLastNumberFirstCharIndex(expression);
      final String lastNumber = expression.substring(index);
      return lastNumber.contains(Expression.NEGATIVE_NUM_FLAG);
    }
  }

  void _toggleMinus() {
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

  void _togglePlus() {
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
      if (!isNumberExtended(charList[i])) {
        break;
      }
    }

    return expression.length - index;
  }
}
