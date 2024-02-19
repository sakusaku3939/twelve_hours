import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twelve_hours/view/component/result_card.dart';
import 'package:twelve_hours/view/id_input_view.dart';
import 'package:twelve_hours/view/member_voting_view.dart';

import 'component/gradient_button.dart';
import 'component/progress_timer.dart';

class Home extends HookConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        behavior: HitTestBehavior.opaque,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Stack(
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _profile(),
                      // const ProgressTimer(),
                      const ResultCard(),
                      GradientButton(
                        "参加",
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const IdInputView(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      GradientButton(
                        "ルームを作成",
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MemberVotingView(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _profile() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox.square(
          dimension: 64,
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(
              'https://pics.prcm.jp/5428c1eb74e79/59774115/jpeg/59774115_220x220.jpeg',
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GenderDropdown(),
            const SizedBox(height: 8),
            SizedBox(
              width: 120,
              child: TextField(
                controller: TextEditingController(text: "田中太郎"),
                maxLength: 16,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "名前を入力",
                  isDense: true,
                  isCollapsed: true,
                  counterText: "",
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class GenderDropdown extends HookConsumerWidget {
  const GenderDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGender = useState("男性");
    return DropdownButton<String>(
      value: selectedGender.value,
      onChanged: (newValue) => selectedGender.value = newValue!,
      items: ["男性", "女性", "その他"].map((gender) {
        return DropdownMenuItem(value: gender, child: Text(gender));
      }).toList(),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      isDense: true,
      underline: const SizedBox.shrink(),
    );
  }
}
