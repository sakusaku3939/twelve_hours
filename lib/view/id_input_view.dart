import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twelve_hours/constant/global_context.dart';
import 'package:twelve_hours/model/firebase_api.dart';
import 'package:twelve_hours/view/member_voting_view.dart';

import 'component/dialog_manager.dart';

class IdInputView extends HookConsumerWidget {
  const IdInputView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNodes = List.generate(4, (_) => useFocusNode());
    final idList = useState(['', '', '', '']);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              children: [
                const SizedBox(height: 160),
                const Text(
                  "ID",
                  style: TextStyle(fontSize: 32),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    4,
                    (index) => _numberField(
                      ref,
                      focusNodes,
                      idList.value,
                      index,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _numberField(
    WidgetRef ref,
    List<FocusNode> focusNodes,
    List<String> idList,
    int index,
  ) {
    return SizedBox(
      width: 50,
      child: TextField(
        autofocus: index == 0,
        focusNode: focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(fontSize: 20, height: 1.1),
        decoration: const InputDecoration(
          counterText: "",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16),
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (value) async {
          if (value.length == 1 && index < focusNodes.length - 1) {
            FocusScope.of(ref.context).requestFocus(focusNodes[index + 1]);
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(ref.context).requestFocus(focusNodes[index - 1]);
          }

          // 4桁の入力が完了したら、ルームに入室
          idList[index] = value;
          if (idList.where((e) => e.isNotEmpty).length == 4) {
            final id = idList.join();
            final exists = await FirebaseApi().existsRoom(roomId: id);
            if (exists) {
              GlobalNavigator.push(
                MemberVotingView(roomId: id),
              );
            } else {
              DialogManager.show(
                title: "Oops..",
                content: "ルームID $id が見つかりませんでした",
                okButtonLabel: "やり直す",
                onOkPressed: () => Navigator.pop(ref.context),
              );
            }
          }
        },
      ),
    );
  }
}
