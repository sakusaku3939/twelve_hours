import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'rounded_sheet_state/rounded_sheet_state.dart';
import '../../constant/main_area.dart';

final roundedSheetProvider =
    StateNotifierProvider.autoDispose<RoundedSheetViewModel, RoundedSheetState>(
  (ref) => RoundedSheetViewModel(ref),
);

class RoundedSheetViewModel extends StateNotifier<RoundedSheetState> {
  final Ref ref;
  final controller = DraggableScrollableController();

  RoundedSheetViewModel(this.ref)
      : super(const RoundedSheetState(
          isShow: false,
        ));

  Future<void> closeSheet() async {
    await controller.animateTo(
      0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
    );
    state = state.copyWith(
      isShow: false,
    );
  }

  Future<void> openSheet({required double size}) async {
    await controller.animateTo(
      size / MainArea.height + 0.03,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
    );
    state = state.copyWith(
      isShow: true,
    );
  }
}
