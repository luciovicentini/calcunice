import 'package:calcunice/models/button_action.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DisplayModel extends StateNotifier<String> {
  DisplayModel() : super('');

  void onButtonTap(ButtonAction action) {
    switch (action) {
      case ButtonAction.equals:
        break;
      case ButtonAction.one:
        state += '1';
        break;
      case ButtonAction.two:
        state += '2';
        break;
      case ButtonAction.three:
        state += '3';
        break;
      case ButtonAction.four:
        state += '4';
        break;
      case ButtonAction.five:
        state += '5';
        break;
      case ButtonAction.six:
        state += '6';
        break;
      case ButtonAction.seven:
        state += '7';
        break;
      case ButtonAction.eight:
        state += '8';
        break;
      case ButtonAction.nine:
        state += '9';
        break;
      case ButtonAction.zero:
        state += '0';
        break;
      case ButtonAction.point:
        state += '.';
        break;
      case ButtonAction.backspace:
        state = state.substring(0, state.length - 1);
        break;
      case ButtonAction.addition:
        state += ' + ';
        break;
      case ButtonAction.substraction:
        state += ' - ';
        break;
      case ButtonAction.multiplication:
        state += ' x ';
        break;
      case ButtonAction.division:
        state += ' ÷ ';
        break;
      case ButtonAction.squareRoot:
        state += ' √(';
        break;
      case ButtonAction.clearScreen:
        clearLine();
        break;
      case ButtonAction.openParenthesis:
        state += '(';
        break;
      case ButtonAction.closeParenthesis:
        state += ')';
        break;
      case ButtonAction.percentage:
        state += '% of ';
        break;
      case ButtonAction.plusMinusToggle:
        // TODO implement plusMinus logic;
        break;
      default:
        throw UnimplementedError('Button Action = $action not implemented yet');
    }
  }

  String get line => this.state;

  void clearLine() {
    state = '';
  }
}
