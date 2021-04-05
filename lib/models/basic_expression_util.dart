mixin BasicExpressionUtil {
  static const String NEGATIVE_NUM_FLAG = 'm';

  static const List<String> numbersPointList = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '.',
  ];

  static const List<String> basicOperators = [
    'x',
    '/',
    '-',
    '+',
  ];

  List<String> getExtendedNumbers() {
    final List<String> list = [];
    list.addAll(numbersPointList);
    list.add(BasicExpressionUtil.NEGATIVE_NUM_FLAG);
    return list;
  }

  bool isNumberOrPointChar(String char) => getExtendedNumbers().contains(char);

  bool isAllNumber(String expression) {
    var isAllNumber = true;
    final list = getExtendedNumbers();
    for (var char in expression.split('')) {
      if (!list.contains(char)) {
        isAllNumber = false;
      }
    }
    return isAllNumber;
  }

  int getAmountOfOpeningParenthesis(String expression) {
    var openParenthesis = 0;
    final charList = expression.split('');
    for (var i = 0; i < charList.length; i++) {
      if (charList[i] == '(') {
        openParenthesis++;
      }
    }
    return openParenthesis;
  }

  int getAmountOfClosingParenthesis(String expression) {
    var closeParenthesis = 0;
    final charList = expression.split('');
    for (var i = 0; i < charList.length; i++) {
      if (charList[i] == ')') {
        closeParenthesis++;
      }
    }
    return closeParenthesis;
  }

  String parseNegativeNumFlag(String number) =>
      number.contains(BasicExpressionUtil.NEGATIVE_NUM_FLAG)
          ? number.replaceFirst(BasicExpressionUtil.NEGATIVE_NUM_FLAG, '-')
          : number;
}
