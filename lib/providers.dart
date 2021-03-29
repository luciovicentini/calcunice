import 'package:calcunice/models/display_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'models/calculator.dart';

final displayProvider =
    StateNotifierProvider<DisplayModel>((ref) => DisplayModel());

final calculatorProvider = Provider<Calculator>((ref) => Calculator());

final historicCalculationsProvider = StateProvider<List<String>>((ref) {
  return [];
});
