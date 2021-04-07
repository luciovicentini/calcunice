import 'package:calcunice/models/display_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'models/calculator_model.dart';
import 'models/historic_list_model.dart';

final displayProv =
    StateNotifierProvider<DisplayModel>((ref) => DisplayModel());

final calculatorProv = Provider.family
    .autoDispose<CalculatorModel, String>((ref, exp) => CalculatorModel(exp));

final historicListModelProvider =
    StateNotifierProvider<HistoricListModel>((ref) => HistoricListModel());

final animatedListKey = GlobalKey<AnimatedListState>();
