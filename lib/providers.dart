import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'models/calculator.dart';

final calculatorProvider = Provider.autoDispose
    .family<Calculator, String>((read, expression) => Calculator(expression));

final displayProvider = StateProvider<String>((ref) {
  return '';
});

final historicCalculationsProvider = StateProvider<List<String>>((ref) {
  return [];
});
