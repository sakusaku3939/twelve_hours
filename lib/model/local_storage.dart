import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static LocalStorage? _instance;
  static late SharedPreferences prefs;

  LocalStorage._();

  factory LocalStorage() {
    _instance ??= LocalStorage._();
    return _instance!;
  }

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }
}
