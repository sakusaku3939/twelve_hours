import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twelve_hours/constant/color_palette.dart';

class ResultCard extends HookConsumerWidget {
  const ResultCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 56),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: ColorPalette.purplePinkGradient,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Container(
          margin: const EdgeInsets.all(4),
          width: 280,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Column(
            children: [
              const SizedBox(height: 8),
              const Text(
                "2024/02/15",
                style: TextStyle(
                  color: ColorPalette.lightGray,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/hold_hands.png",
                    height: 32,
                  ),
                  const SizedBox(width: 24),
                  const Text(
                    "1組",
                    style: TextStyle(
                      fontSize: 28,
                      color: ColorPalette.darkPink,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "あなたへの",
                    style: TextStyle(
                      fontSize: 20,
                      color: ColorPalette.darkPink,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    "assets/images/good.png",
                    height: 32,
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "2人",
                    style: TextStyle(
                      fontSize: 20,
                      color: ColorPalette.darkPink,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _profile(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profile() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox.square(
            dimension: 64,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                'https://pics.prcm.jp/5428c1eb74e79/59774115/jpeg/59774115_220x220.jpeg',
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "山田花子",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "@username",
                style: TextStyle(fontSize: 12, color: ColorPalette.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
