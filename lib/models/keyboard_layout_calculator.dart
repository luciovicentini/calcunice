class KeyboardLayoutCalculator {
  KeyboardLayoutCalculator({this.widthMargin = 0, this.heightMargin = 0});

  static const double originalButtonWidth = 820;
  static const double originalButtonHeight = 660;
  static const double minMargin = 8;

  static const buttonInRow = 4;
  static const totalRows = 6;

  double widthSize = originalButtonWidth;
  double widthMargin;

  double heightSize = originalButtonHeight;
  double heightMargin;

  bool _recalculate = false;

  static KeyboardLayoutCalculator calculateFromContainerSize(
      double maxWidth, double maxHeight) {
    final keyboard = KeyboardLayoutCalculator()
      .._calculate(maxWidth, maxHeight);
    return keyboard;
  }

  void _calculate(double maxWidth, double maxHeight) {
    do {
      _calculateWidth(maxWidth);
      _calculateHeight(maxHeight);
    } while (_recalculate);
  }

  void _calculateWidth(double maxWidth) {
    _recalculate = false;
    widthSize = _calculateWidthSizeProp();
    widthMargin = _calculateMargin(maxWidth, widthSize, buttonInRow);

    var totalNeededWidth =
        _calculateTotalNeeded(widthMargin, widthSize, buttonInRow);
    while (totalNeededWidth > maxWidth) {
      if (widthMargin > minMargin) {
        widthMargin -= 4;
      } else {
        widthSize--;
        _recalculate = true;
      }
      totalNeededWidth =
          _calculateTotalNeeded(widthMargin, widthSize, buttonInRow);
    }
  }

  void _calculateHeight(double maxHeight) {
    _recalculate = false;
    heightSize = _calculateHeightSizeProp();
    heightMargin = _calculateMargin(maxHeight, heightSize, totalRows);

    while (_calculateTotalNeeded(heightMargin, heightSize, totalRows) >
        maxHeight) {
      if (heightMargin > minMargin) {
        heightMargin -= 4;
      } else {
        heightSize--;
        _recalculate = true;
      }
    }
  }

  double _calculateTotalNeeded(double margin, double buttonSize, int amount) =>
      margin * (amount - 1) + (buttonSize * amount);

  double _calculateMargin(
      double containerSize, double buttonSize, int amountButtons) {
    var margin =
        (containerSize - (buttonSize * amountButtons)) / (amountButtons - 1);

    if (margin < minMargin) {
      margin = minMargin;
    }

    return margin;
  }

  double _calculateWidthSizeProp() =>
      originalButtonWidth * heightSize / originalButtonHeight;

  double _calculateHeightSizeProp() =>
      originalButtonHeight * widthSize / originalButtonWidth;

  @override
  String toString() => 'KeyboardLayoutCalculation{widthSize: $widthSize, '
      ' widthMargin: $widthMargin,'
      ' heightSize: $heightSize, '
      ' heightMargin: $heightMargin, \n'
      ' totalWidth: ${_calculateTotalNeeded(widthMargin, widthSize, buttonInRow)},'
      ' totalHeight: ${_calculateTotalNeeded(heightMargin, heightSize, totalRows)}';

  double calculateHeight(int stepsY) {
    if (stepsY == 0) {
      return 0;
    }
    final height = (heightSize * stepsY) + (heightMargin * (stepsY - 1));
    return height;
  }

  double calculateWidth(int stepsX) {
    if (stepsX == 0) {
      return 0;
    }
    final width = (widthSize * stepsX) + (widthMargin * (stepsX - 1));
    return width;
  }
}
