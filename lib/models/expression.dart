import 'button_action.dart';

abstract class Expression extends Object {
  static const String NEGATIVE_NUM_FLAG = 'm';

  String expression = '';

  void onButtonTap(ButtonAction action) {
    switch (action) {
      case ButtonAction.equals:
        break;
      case ButtonAction.one:
        expression += '1';
        break;
      case ButtonAction.two:
        expression += '2';
        break;
      case ButtonAction.three:
        expression += '3';
        break;
      case ButtonAction.four:
        expression += '4';
        break;
      case ButtonAction.five:
        expression += '5';
        break;
      case ButtonAction.six:
        expression += '6';
        break;
      case ButtonAction.seven:
        expression += '7';
        break;
      case ButtonAction.eight:
        expression += '8';
        break;
      case ButtonAction.nine:
        expression += '9';
        break;
      case ButtonAction.zero:
        expression += '0';
        break;
      case ButtonAction.point:
        expression += '.';
        break;
      case ButtonAction.backspace:
        expression = expression.substring(0, expression.length - 1);
        break;
      case ButtonAction.addition:
        expression += '+';
        break;
      case ButtonAction.substraction:
        expression += '-';
        break;
      case ButtonAction.multiplication:
        expression += 'x';
        break;
      case ButtonAction.division:
        expression += '÷';
        break;
      case ButtonAction.squareRoot:
        expression += '√(';
        break;
      case ButtonAction.clearScreen:
        clearLine();
        break;
      case ButtonAction.openParenthesis:
        expression += '(';
        break;
      case ButtonAction.closeParenthesis:
        expression += ')';
        break;
      case ButtonAction.percentage:
        expression += '%';
        break;
      case ButtonAction.plusMinusToggle:
        togglePlusMinus();
        break;
      default:
        throw UnimplementedError('Button Action = $action not implemented yet');
    }
  }

  void clearLine();

  void togglePlusMinus();
}
