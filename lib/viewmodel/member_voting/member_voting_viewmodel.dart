import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twelve_hours/viewmodel/member_voting/member_voting_state/voting_member.dart';

import 'member_voting_state/member_voting_state.dart';

final memberVotingProvider =
    StateNotifierProvider.autoDispose<MemberVotingViewModel, MemberVotingState>(
  (ref) => MemberVotingViewModel(ref),
);

class MemberVotingViewModel extends StateNotifier<MemberVotingState> {
  final Ref ref;

  int totalSelected = 0;
  late List<VotingMember> allVotingMembers;

  MemberVotingViewModel(this.ref)
      : super(const MemberVotingState(
          votingMembers: [],
        )) {
    init();
  }

  void init() {
    allVotingMembers = [
      const VotingMember(id: 0, name: "name", gender: "男性", selected: false),
      const VotingMember(id: 1, name: "name", gender: "男性", selected: false),
      const VotingMember(id: 2, name: "name", gender: "女性", selected: false),
      const VotingMember(id: 3, name: "name", gender: "女性", selected: false),
      const VotingMember(id: 4, name: "name", gender: "その他", selected: false),
      const VotingMember(id: 5, name: "name", gender: "男性", selected: false),
    ];
    state = state.copyWith(votingMembers: allVotingMembers);
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
      allVotingMembers = allVotingMembers.map(
        (e) => e.id == member.id ? e.copyWith(selected: member.selected) : e,
      ).toList();
      state = state.copyWith(votingMembers: updatingMembers);
    }
  }

  void changeGenderTab(int value) {
    final genders = ["全て", "男性", "女性", "その他"];
    if (genders[value] == "全て") {
      state = state.copyWith(votingMembers: allVotingMembers);
    } else {
      state = state.copyWith(
        votingMembers: allVotingMembers
            .where((e) => e.gender == genders[value])
            .toList(),
      );
    }
  }
}
