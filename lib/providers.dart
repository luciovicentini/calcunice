import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:calcunice/models/button_action.dart';
import 'package:calcunice/models/calculator_model.dart';
import 'package:calcunice/models/display_model.dart';
import 'package:calcunice/models/historic_list_model.dart';

final StateNotifierProvider<DisplayModel> displayProvider =
    StateNotifierProvider<DisplayModel>((ref) => DisplayModel());

final calculatorProv = Provider.family
    .autoDispose<CalculatorModel, String>((ref, exp) => CalculatorModel(exp));

final StateNotifierProvider<HistoricListModel> historicListModelProvider =
    StateNotifierProvider<HistoricListModel>((ref) => HistoricListModel());

final clearButtonTextProvider = Provider<String>((ref) {
  final displayState = ref.watch(displayProvider.state);
  return displayState.when(
    empty: () => 'CA',
    expression: (_) => 'C',
  );
});

final clearButtonActionProvider = Provider<ButtonAction>((ref) {
  final displayState = ref.watch(displayProvider.state);
  return displayState.when(
    empty: () => ButtonAction.clearHistoricList,
    expression: (_) => ButtonAction.clearScreen,
  );
});

final StateProvider<bool> isLightProvider = StateProvider<bool>((ref) => true);

GlobalKey<AnimatedListState> animatedListKey = GlobalKey<AnimatedListState>();
