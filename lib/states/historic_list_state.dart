import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'historic_list_state.freezed.dart';

@freezed
class HistoricListState with _$HistoricListState {
  const factory HistoricListState.empty() = _Empty;
  const factory HistoricListState.list(List<String> expressions) = _List;
}
