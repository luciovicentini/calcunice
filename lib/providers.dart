import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'models/calculator.dart';
/* TODO: los botones solamente actualizan el estdo de la expressionProvider 
  y el displayprovider se actualiza parseando el expressionProvider */

/* TODO: convertir Calculator model en un StateNotifier? */

final calculatorProvider = Provider.autoDispose
    .family<Calculator, String>((read, expression) => Calculator(expression));

final displayProvider = StateProvider<String>((ref) {
  return '';
});

final expressionProvider = StateProvider<String>((ref) {
  return '';
});

final historicCalculationsProvider = StateProvider<List<String>>((ref) {
  return [];
});
