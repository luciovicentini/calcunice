import 'expression.dart';

mixin BasicExpressionUtil {
  final List<String> numbersList = [
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

  List<String> getExtendedNumbers() {
    final List<String> list = [];
    list.addAll(numbersList);
    list.add(Expression.NEGATIVE_NUM_FLAG);
    return list;
  }

  bool isNumberExtended(String char) => getExtendedNumbers().contains(char);

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

  String parseNegativeNumFlag(String number) =>
      number.contains(Expression.NEGATIVE_NUM_FLAG)
          ? number.replaceFirst(Expression.NEGATIVE_NUM_FLAG, '-')
          : number;
}
