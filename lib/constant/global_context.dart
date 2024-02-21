import 'package:flutter/material.dart';

GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();

BuildContext get globalContext =>
    globalNavigatorKey.currentState!.overlay!.context;

class GlobalNavigator {
  static Future<void> push(Widget widget) async {
    await Navigator.push(
      globalContext,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  static void pop() {
    Navigator.pop(globalContext);
  }
}
