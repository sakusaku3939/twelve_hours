import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twelve_hours/model/database_table.dart';

import '../../model/sqlite_helper.dart';
import 'room_card_state/room_card_state.dart';

final roomCardProvider =
    StateNotifierProvider.autoDispose<RoomCardViewModel, RoomCardState>(
  (ref) => RoomCardViewModel(ref),
);

class RoomCardViewModel extends StateNotifier<RoomCardState> {
  final Ref ref;
  final _sqlite = SqliteHelper();

  RoomCardViewModel(this.ref)
      : super(const RoomCardState(
          rooms: [],
        )) {
    init();
  }

  Future<void> init() async {
    final res = await _sqlite.queryAll(RoomTable.name);
    final roomList = res.map((row) => RoomTable.fromMap(row)).toList();
    state = state.copyWith(rooms: roomList);
  }
}
