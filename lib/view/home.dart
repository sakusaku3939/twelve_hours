import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twelve_hours/view/utils/gradient_button.dart';
import 'package:twelve_hours/view/utils/progress_timer.dart';

class Home extends HookConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProgressTimer(),
              GradientButton("参加"),
              SizedBox(height: 12),
              GradientButton("ルームを作成"),
            ],
          ),
        ),
      ),
    );
  }
}
