import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VotingProfileIcon extends HookConsumerWidget {
  const VotingProfileIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: SizedBox.square(
                  dimension: 72,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                      'https://pics.prcm.jp/5428c1eb74e79/59774115/jpeg/59774115_220x220.jpeg',
                    ),
                  ),
                ),
              ),
              Positioned(
                height: 28,
                right: 0,
                bottom: 0,
                child: Image.asset("assets/images/good.png"),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            "name",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
