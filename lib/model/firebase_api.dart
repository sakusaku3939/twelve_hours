import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';

import 'local_storage.dart';

class FirebaseApi {
  static final FirebaseApi _instance = FirebaseApi._internal();

  FirebaseApi._internal();

  factory FirebaseApi() => _instance;

  final userId = const Uuid().v4();

  Future<String> createRoom() async {
    final ref = FirebaseDatabase.instance.ref("rooms");
    final random = Random();
    late String roomId;
    bool exists = true;

    // 重複しないroomId（0001 ~ 9999）が見つかったら、そのIDで部屋を作成
    while (exists) {
      final randomNumber = random.nextInt(9999) + 1;
      roomId = randomNumber.toString().padLeft(4, '0');

      final snapshot = await ref.child(roomId).get();
      exists = snapshot.exists;
    }

    await ref.child(roomId).set({
      "members": {
        userId: {
          "name": LocalStorage.prefs.getString("name") ?? "anonymous",
          "gender": LocalStorage.prefs.getString("gender") ?? "男性",
        },
      },
      "createAt": DateTime.now().toIso8601String(),
    });

    print("Room $roomId created successfully");
    return roomId;
  }

  void joinRoom({
    required String roomId,
    required void Function(Object?) onValueChanged,
  }) async {
    final ref = FirebaseDatabase.instance.ref("rooms/$roomId");
    ref.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      onValueChanged(data);
    });
    print("Room $roomId joined successfully");
  }

  Future<bool> existsRoom({required String roomId}) async {
    final res = await FirebaseDatabase.instance.ref("rooms/$roomId").get();
    return res.exists;
  }

  Future<void> _testCreateRoom() async {
    final ref = FirebaseDatabase.instance.ref("rooms");
    await ref.child("1234").set({
      "members": {
        "0": {
          "name": "name",
          "gender": "男性",
          "likedTo": ["2", "3"],
          "likedBy": ["1", "2"],
        },
        "1": {
          "name": "name",
          "gender": "男性",
          "likedTo": ["2", "0"],
          "likedBy": ["3"],
        },
        "2": {
          "name": "name",
          "gender": "女性",
          "likedTo": ["0"],
          "likedBy": ["0", "1"],
        },
        "3": {
          "name": "name",
          "gender": "女性",
          "likedTo": ["1", "5"],
          "likedBy": ["0", "5"],
        },
        "4": {
          "name": "name",
          "gender": "その他",
          "likedTo": ["5"],
          "likedBy": ["5"],
        },
        "5": {
          "name": "name",
          "gender": "男性",
          "likedTo": ["3", "4"],
          "likedBy": ["4", "3"],
        },
      },
      "createAt": DateTime.now().toIso8601String(),
    });
  }
}
