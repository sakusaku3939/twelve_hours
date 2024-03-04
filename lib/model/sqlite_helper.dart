import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:twelve_hours/model/database_table.dart';

class SqliteHelper {
  static SqliteHelper? _instance;
  static Database? _database;

  SqliteHelper._();

  factory SqliteHelper() {
    _instance ??= SqliteHelper._();
    return _instance!;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "Database.db");

    // テスト用
    await deleteDatabase(path);

    final database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE ${RoomTable.name} (
            id INTEGER PRIMARY KEY,
            likeIds TEXT NOT NULL,
            matchedUsers TEXT,
            likedCount INTEGER,
            date TEXT NOT NULL
          )
          ''');
        await db.insert(
          RoomTable.name,
          RoomTable(
            id: 0,
            likeIds: "1",
            matchedUsers: "",
            likedCount: 1,
            date: DateTime.tryParse("2024-02-19 07:00:00")!,
          ).toMap(),
        );
        await db.insert(
          RoomTable.name,
          RoomTable(
            id: 1,
            likeIds: "2,4",
            matchedUsers: "1",
            likedCount: 2,
            date: DateTime.tryParse("2024-02-20 07:00:00")!,
          ).toMap(),
        );
        await db.insert(
          RoomTable.name,
          RoomTable(
            id: 2,
            likeIds: "0,2",
            matchedUsers: null,
            likedCount: null,
            date: DateTime.now(),
          ).toMap(),
        );
      },
    );
    return database;
  }

  Future<int> insert(DatabaseTable table) async {
    Database db = await _instance!.database;
    return await db.insert(table.tableName, table.toMap());
  }

  Future<List<Map<String, dynamic>>> queryAll(String tableName) async {
    Database db = await _instance!.database;
    return await db.query(tableName);
  }
}
