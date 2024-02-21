import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';

class FirebaseApi {
  static final FirebaseApi _instance = FirebaseApi._internal();

  FirebaseApi._internal();

  factory FirebaseApi() => _instance;

  Future<void> createRoom() async {
    final ref = FirebaseDatabase.instance.ref("rooms");
    final userId = const Uuid().v4();
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
          "name": "田中太郎",
          "gender": "男性",
          "likedBy": {},
        },
      },
      "createAt": DateTime.now().toIso8601String(),
    });

    print('Room $roomId created successfully');
  }
}
