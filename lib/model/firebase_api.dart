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
    await ref.child("members").update({
      userId: {
        "name": LocalStorage.prefs.getString("name") ?? "anonymous",
        "gender": LocalStorage.prefs.getString("gender") ?? "男性",
      },
    });
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
        "084f935f-4c9b-442f-8bc0-f909e545136c": {
          "name": "name1",
          "gender": "男性",
          "likedTo": ["4049d28a-4ed4-4017-aad8-79f7b52eaf5d", "a93375e1-1131-46d2-82c6-ae86d3a76566"],
          "likedBy": ["d0eb769b-6693-4893-837a-314bae650901", "4049d28a-4ed4-4017-aad8-79f7b52eaf5d"],
        },
        "d0eb769b-6693-4893-837a-314bae650901": {
          "name": "name2",
          "gender": "男性",
          "likedTo": ["4049d28a-4ed4-4017-aad8-79f7b52eaf5d", "084f935f-4c9b-442f-8bc0-f909e545136c"],
          "likedBy": ["a93375e1-1131-46d2-82c6-ae86d3a76566"],
        },
        "4049d28a-4ed4-4017-aad8-79f7b52eaf5d": {
          "name": "name3",
          "gender": "女性",
          "likedTo": ["084f935f-4c9b-442f-8bc0-f909e545136c"],
          "likedBy": ["084f935f-4c9b-442f-8bc0-f909e545136c", "d0eb769b-6693-4893-837a-314bae650901"],
        },
        "a93375e1-1131-46d2-82c6-ae86d3a76566": {
          "name": "name4",
          "gender": "女性",
          "likedTo": ["d0eb769b-6693-4893-837a-314bae650901", "ec2ec759-39a6-40dd-8534-73bb5106cfce"],
          "likedBy": ["084f935f-4c9b-442f-8bc0-f909e545136c", "ec2ec759-39a6-40dd-8534-73bb5106cfce"],
        },
        "af8b06af-84ac-489b-b4bb-aedfa79b8386": {
          "name": "name5",
          "gender": "その他",
          "likedTo": ["ec2ec759-39a6-40dd-8534-73bb5106cfce"],
          "likedBy": ["ec2ec759-39a6-40dd-8534-73bb5106cfce"],
        },
        "ec2ec759-39a6-40dd-8534-73bb5106cfce": {
          "name": "name6",
          "gender": "男性",
          "likedTo": ["a93375e1-1131-46d2-82c6-ae86d3a76566", "af8b06af-84ac-489b-b4bb-aedfa79b8386"],
          "likedBy": ["af8b06af-84ac-489b-b4bb-aedfa79b8386", "a93375e1-1131-46d2-82c6-ae86d3a76566"],
        },
      },
      "createAt": DateTime.now().toIso8601String(),
    });
  }
}
