import 'package:flutter/animation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress_timer_state.freezed.dart';

@freezed
class ProgressTimerState with _$ProgressTimerState {
  const factory ProgressTimerState({
    required AnimationController? controller,
  }) = _ProgressTimerState;
}