import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twelve_hours/view_model/progress_timer/progress_timer_state/progress_timer_state.dart';

final progressTimerProvider = StateNotifierProvider.autoDispose<
    ProgressTimerViewModel, ProgressTimerState>(
  (ref) => ProgressTimerViewModel(ref),
);

class ProgressTimerViewModel extends StateNotifier<ProgressTimerState> {
  final Ref ref;
  final recordedTime = DateTime.now().subtract(const Duration(hours: 1));

  ProgressTimerViewModel(this.ref)
      : super(const ProgressTimerState(
          controller: null,
        )) {
    init();
  }

  void init() {
  }
}
