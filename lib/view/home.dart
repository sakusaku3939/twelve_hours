import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twelve_hours/view/component/rounded_sheet.dart';
import 'package:twelve_hours/viewmodel/rounded_sheet/rounded_sheet_viewmodel.dart';

import 'component/gradient_button.dart';
import 'component/progress_timer.dart';

class Home extends HookConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        ref.read(roundedSheetProvider.notifier).closeSheet();
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _profile(ref),
                    const ProgressTimer(),
                    const GradientButton("参加"),
                    const SizedBox(height: 12),
                    const GradientButton("ルームを作成"),
                  ],
                ),
              ),
              const RoundedSheet(
                child: Column(
                  children: [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profile(WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.read(roundedSheetProvider.notifier).openSheet(size: 300),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox.square(
            dimension: 64,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                  'https://pics.prcm.jp/5428c1eb74e79/59774115/jpeg/59774115_220x220.jpeg'),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "男性",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "田中太郎",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
