import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twelve_hours/viewmodel/member_voting/member_voting_viewmodel.dart';

import '../../viewmodel/member_voting/member_voting_state/voting_member.dart';

class VotingProfileIcon extends HookConsumerWidget {
  const VotingProfileIcon(
    this.member, {
    super.key,
    required this.index,
  });

  final VotingMember member;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () =>
          ref.read(memberVotingProvider.notifier).toggleSelected(index),
      child: Center(
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
                  child: member.selected
                      ? Image.asset("assets/images/good.png")
                      : Opacity(
                          opacity: 0.2,
                          child: Image.asset("assets/images/good.png"),
                        ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              member.name,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
