import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twelve_hours/model/firebase_api.dart';
import 'package:twelve_hours/view/component/dialog_manager.dart';
import 'package:twelve_hours/viewmodel/member_voting/member_voting_state/voting_member.dart';

import 'member_voting_state/member_voting_state.dart';

final memberVotingProvider =
    StateNotifierProvider.autoDispose<MemberVotingViewModel, MemberVotingState>(
  (ref) => MemberVotingViewModel(ref),
);

class MemberVotingViewModel extends StateNotifier<MemberVotingState> {
  final Ref ref;

  int totalSelected = 0;
  List<VotingMember> allVotingMembers = [];

  MemberVotingViewModel(this.ref)
      : super(const MemberVotingState(
          votingMembers: [],
        ));

  void init(String roomId) {
    FirebaseApi().joinRoom(
      roomId: roomId,
      onValueChanged: (rawData) {
        final data = Map<String, dynamic>.from(rawData as Map);
        final members = Map<String, dynamic>.from(data["members"]);
        allVotingMembers = [];

        for (final member in members.entries) {
          allVotingMembers.add(
            VotingMember(
              id: member.key,
              name: member.value["name"] ?? "anonymous",
              gender: member.value["gender"] ?? "男性",
              selected: false,
            ),
          );
        }
        if (mounted) {
          state = state.copyWith(votingMembers: allVotingMembers);
        }
      },
    );
  }

  void toggleSelected(int index) {
    // selectedを true<->false に切り替え
    final updatingMembers = [...state.votingMembers];
    final member = updatingMembers[index].copyWith(
      selected: !updatingMembers[index].selected,
    );
    updatingMembers[index] = member;
    totalSelected = updatingMembers.where((e) => e.selected).length;

    // 選択数が上限を超えている場合は更新しない
    if (totalSelected > 2) {
      totalSelected = 2;
    } else {
      // allVotingMembers と votingMembers の両方に反映
      allVotingMembers = allVotingMembers
          .map(
            (e) =>
                e.id == member.id ? e.copyWith(selected: member.selected) : e,
          )
          .toList();
      state = state.copyWith(votingMembers: updatingMembers);
    }
  }

  void changeGenderTab(int value) {
    final genders = ["全て", "男性", "女性", "その他"];
    if (genders[value] == "全て") {
      state = state.copyWith(votingMembers: allVotingMembers);
    } else {
      state = state.copyWith(
        votingMembers:
            allVotingMembers.where((e) => e.gender == genders[value]).toList(),
      );
    }
  }

  void submitSelected() {
    DialogManager.show(
      title: "確定する？",
      content: "この選択で確定しますか？この後に変更することはできません。",
      okButtonLabel: "OK！",
      onOkPressed: () => {},
    );
  }
}
