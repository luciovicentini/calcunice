import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'display_state.freezed.dart';

@freezed
class DisplayState with _$DisplayState {
  const factory DisplayState.empty() = _Empty;
  const factory DisplayState.expression(String expression) = _Expression;
}
