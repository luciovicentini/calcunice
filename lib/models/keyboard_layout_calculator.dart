import 'package:calcunice/common/calculator_exception.dart';

class KeyboardLayoutCalculator {
  KeyboardLayoutCalculator();

  KeyboardLayoutCalculator.calculateFromContainerSize(
      double width, double height) {
    if (width < 300 && height < 400) {
      throw CalculatorException(
          'Width ($width) and height ($height) are too small.');
    }
    _calculate(width, height);
  }

  static const double margin = 8;
  static const int buttonInRow = 4;
  static const int totalRows = 6;
  static const widthTotalMargin = margin * buttonInRow + 1;
  static const heightTotalMargin = margin * totalRows + 1;

  double widthSize = 0;
  double heightSize = 0;

  void _calculate(double containerWidth, double containerHeight) {
    _calculateWidth(containerWidth);
    _calculateHeight(containerHeight);
  }

  void _calculateWidth(double containerWidth) {
    widthSize = (containerWidth - widthTotalMargin) / buttonInRow;
  }

  void _calculateHeight(double containerHeight) {
    heightSize = (containerHeight - heightTotalMargin) / totalRows;
  }

  /*
  @override
  String toString() => 'KeyboardLayoutCalculation{widthSize: $widthSize, '
      ' widthMargin: $widthMargin,'
      ' heightSize: $heightSize, '
      ' heightMargin: $heightMargin, \n'
      ' totalWidth: ${_calculateTotalNeeded(widthMargin, widthSize, buttonInRow)},'
      ' totalHeight: ${_calculateTotalNeeded(heightMargin, heightSize, totalRows)}';*/

  double calculateHeight(int stepsY) {
    if (stepsY == 0) {
      return 0;
    }
    final height = (heightSize * stepsY) + (margin * (stepsY - 1));
    return height;
  }

  double calculateWidth(int stepsX) {
    if (stepsX == 0) {
      return 0;
    }
    final width = (widthSize * stepsX) + (margin * (stepsX - 1));
    return width;
  }
}
