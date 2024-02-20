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
          has12hoursPassed: [],
        )) {
    init();
  }

  Future<void> init() async {
    final res = await _sqlite.queryAll(RoomTable.name);
    final roomList = res.reversed.map((row) => RoomTable.fromMap(row)).toList();

    final hoursPassedList = roomList.map((room) {
      final twelveHoursLater = room.date.add(const Duration(hours: 12));

      // 12時間が経過している場合は、サーバーから結果を取得
      final isPassed = DateTime.now().isAfter(twelveHoursLater);
      if (isPassed) fetchMatchingResults();

      return isPassed;
    }).toList();

    state = state.copyWith(
      rooms: roomList,
      has12hoursPassed: hoursPassedList,
    );
  }

  Future<void> fetchMatchingResults() async {}

  List<int> splitIds(String text) {
    return text
        .split(",")
        .where((e) => e.isNotEmpty)
        .map((e) => int.parse(e))
        .toList();
  }
}
