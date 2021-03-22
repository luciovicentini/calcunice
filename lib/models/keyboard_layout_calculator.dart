class KeyboardLayoutCalculator {
  static const double ORIGINAL_BUTTON_WIDTH = 820;
  static const double ORIGINAL_BUTTON_HEIGHT = 660;
  static const double MIN_MARGIN = 8;

  static const BUTTONS_IN_ROW = 4;
  static const TOTAL_ROWS = 6;

  double widthSize = ORIGINAL_BUTTON_WIDTH;
  double widthMargin;

  double heightSize = ORIGINAL_BUTTON_HEIGHT;
  double heightMargin;

  bool _recalculate = false;

  KeyboardLayoutCalculator({this.widthMargin = 0, this.heightMargin = 0});

  static KeyboardLayoutCalculator calculateFromContainerSize(
      double maxWidth, double maxHeight) {
    final keyboard = KeyboardLayoutCalculator();
    keyboard._calculate(maxWidth, maxHeight);
    return keyboard;
  }

  _calculate(double maxWidth, double maxHeight) {
    do {
      _calculateWidth(maxWidth);
      _calculateHeight(maxHeight);
    } while (_recalculate);
  }

  _calculateWidth(double maxWidth) {
    _recalculate = false;
    widthSize = _calculateWidthSizeProp();
    widthMargin = _calculateMargin(maxWidth, widthSize, BUTTONS_IN_ROW);

    double totalNeededWidth =
        _calculateTotalNeeded(widthMargin, widthSize, BUTTONS_IN_ROW);
    while (totalNeededWidth > maxWidth) {
      if (widthMargin > MIN_MARGIN) {
        widthMargin -= 4;
      } else {
        widthSize--;
        _recalculate = true;
      }
      totalNeededWidth =
          _calculateTotalNeeded(widthMargin, widthSize, BUTTONS_IN_ROW);
    }
  }

  _calculateHeight(double maxHeight) {
    _recalculate = false;
    heightSize = _calculateHeightSizeProp();
    heightMargin = _calculateMargin(maxHeight, heightSize, TOTAL_ROWS);

    while (_calculateTotalNeeded(heightMargin, heightSize, TOTAL_ROWS) >
        maxHeight) {
      if (heightMargin > MIN_MARGIN) {
        heightMargin -= 4;
      } else {
        heightSize--;
        _recalculate = true;
      }
    }
  }

  double _calculateTotalNeeded(double margin, double buttonSize, int amount) {
    return (margin * (amount - 1) + (buttonSize * amount));
  }

  double _calculateMargin(
      double containerSize, double buttonSize, int amountButtons) {
    var margin =
        (containerSize - (buttonSize * amountButtons)) / (amountButtons - 1);

    if (margin < MIN_MARGIN) margin = MIN_MARGIN;

    return margin;
  }

  double _calculateWidthSizeProp() {
    return ORIGINAL_BUTTON_WIDTH * heightSize / ORIGINAL_BUTTON_HEIGHT;
  }

  double _calculateHeightSizeProp() {
    return ORIGINAL_BUTTON_HEIGHT * widthSize / ORIGINAL_BUTTON_WIDTH;
  }

  @override
  String toString() {
    return 'KeyboardLayoutCalculation{widthSize: $widthSize, widthMargin: $widthMargin,'
        ' heightSize: $heightSize, heightMargin: $heightMargin, \n'
        ' totalWidth: ${_calculateTotalNeeded(widthMargin, widthSize, BUTTONS_IN_ROW)},'
        ' totalHeight: ${_calculateTotalNeeded(heightMargin, heightSize, TOTAL_ROWS)}';
  }

  double calculateHeight(int stepsY) {
    if (stepsY == 0) return 0;
    double height =
        (this.heightSize * stepsY) + (this.heightMargin * (stepsY - 1));
    return height;
  }

  double calculateWidth(int stepsX) {
    if (stepsX == 0) return 0;
    final width = (this.widthSize * stepsX) + (this.widthMargin * (stepsX - 1));
    return width;
  }
}
