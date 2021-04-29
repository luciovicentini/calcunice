extension ExpressionParsing on String {
  String getResult() {
    if (contains('=')) {
      final equalIndex = lastIndexOf('=');
      final result = substring(equalIndex + 2);
      return result;
    } else {
      throw Exception('Expression $this must have an equal sign');
    }
  }
}
