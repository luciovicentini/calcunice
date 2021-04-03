import 'package:calcunice/models/display_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'models/calculator_model.dart';

final displayProv =
    StateNotifierProvider<DisplayModel>((ref) => DisplayModel());

final calculatorProv = Provider.family
    .autoDispose<CalculatorModel, String>((ref, exp) => CalculatorModel(exp));

final historicCalculationsProvider = StateProvider<List<String>>((ref) {
  return [];
});

final animatedListKey = GlobalKey<AnimatedListState>();
