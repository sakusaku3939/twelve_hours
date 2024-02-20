import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twelve_hours/model/database_table.dart';

part 'room_card_state.freezed.dart';

@freezed
class RoomCardState with _$RoomCardState {
  const factory RoomCardState({
    required List<RoomTable> rooms,
    required List<bool> has12hoursPassed,
  }) = _RoomCardState;
}