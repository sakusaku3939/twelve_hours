import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twelve_hours/constant/color_palette.dart';
import 'package:twelve_hours/constant/main_area.dart';
import 'package:twelve_hours/view/component/gradient_button.dart';
import 'package:twelve_hours/view/component/voting_profile_icon.dart';
import 'package:twelve_hours/viewmodel/member_voting/member_voting_viewmodel.dart';

class MemberVotingView extends HookConsumerWidget {
  const MemberVotingView({
    super.key,
    required this.roomId,
  });

  final String roomId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = useState(0);
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(memberVotingProvider.notifier).init(roomId);
      });
      return null;
    }, []);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: MainArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "ID: $roomId",
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${ref.read(memberVotingProvider.notifier).allVotingMembers.length}人",
                    style: const TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    child: CustomSlidingSegmentedControl(
                      initialValue: 0,
                      children: {
                        0: Text(
                          "全て",
                          style: TextStyle(
                            fontSize: 12,
                            color: current.value == 0
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        1: Text(
                          "男性",
                          style: TextStyle(
                            fontSize: 12,
                            color: current.value == 1
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        2: Text(
                          "女性",
                          style: TextStyle(
                            fontSize: 12,
                            color: current.value == 2
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        3: Text(
                          "その他",
                          style: TextStyle(
                            fontSize: 12,
                            color: current.value == 3
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      },
                      decoration: BoxDecoration(
                        color: ColorPalette.whiteGray,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      thumbDecoration: BoxDecoration(
                        color: ColorPalette.pink,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      isStretch: true,
                      innerPadding: const EdgeInsets.all(2),
                      height: 28,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOut,
                      onValueChanged: (v) {
                        current.value = v;
                        ref
                            .read(memberVotingProvider.notifier)
                            .changeGenderTab(v);
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 240,
                    child: GridView.builder(
                      itemCount:
                          ref.watch(memberVotingProvider).votingMembers.length,
                      itemBuilder: (context, index) {
                        return VotingProfileIcon(
                          ref.watch(memberVotingProvider).votingMembers[index],
                          index: index,
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                      ),
                    ),
                  ),
                  const SizedBox(height: 56),
                  GradientButton(
                    "選択を確定",
                    onPressed:
                        ref.read(memberVotingProvider.notifier).submitSelected,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
