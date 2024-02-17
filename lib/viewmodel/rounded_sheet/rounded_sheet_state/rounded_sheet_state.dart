import 'package:freezed_annotation/freezed_annotation.dart';

part 'rounded_sheet_state.freezed.dart';

@freezed
class RoundedSheetState with _$RoundedSheetState {
  const factory RoundedSheetState({
    required bool isShow,
  }) = _RoundedSheetState;
}