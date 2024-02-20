abstract class DatabaseTable {
  DatabaseTable(this.tableName, {required this.id});

  final String tableName;
  final int id;

  Map<String, dynamic> toMap();
}

class RoomTable extends DatabaseTable {
  RoomTable({
    required id,
    required this.likeIds,
    required this.matchedUsers,
    required this.likedCount,
    required this.date,
  }) : super(name, id: id);

  final String likeIds;
  final String? matchedUsers;
  final int? likedCount;
  final DateTime date;

  static const String name = "room_table";

  factory RoomTable.fromMap(Map<String, dynamic> map) => RoomTable(
    id: map["id"],
    likeIds: map["likeIds"],
    matchedUsers: map["matchedUsers"],
    likedCount: map["likedCount"],
    date: DateTime.parse(map["date"]).toLocal(),
  );

  @override
  Map<String, dynamic> toMap() => {
    "id": id,
    "likeIds": likeIds,
    "matchedUsers": matchedUsers,
    "likedCount": likedCount,
    "date": date.toUtc().toIso8601String(),
  };
}
