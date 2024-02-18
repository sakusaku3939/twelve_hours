import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twelve_hours/viewmodel/member_voting/member_voting_state/voting_member.dart';

import 'member_voting_state/member_voting_state.dart';

final memberVotingProvider =
    StateNotifierProvider.autoDispose<MemberVotingViewModel, MemberVotingState>(
  (ref) => MemberVotingViewModel(ref),
);

class MemberVotingViewModel extends StateNotifier<MemberVotingState> {
  final Ref ref;

  int selectCount = 0;

  MemberVotingViewModel(this.ref)
      : super(const MemberVotingState(
          votingMembers: [],
        )) {
    init();
  }

  void init() {
    state = state.copyWith(votingMembers: [
      const VotingMember(name: "name", selected: false),
      const VotingMember(name: "name", selected: false),
      const VotingMember(name: "name", selected: false),
      const VotingMember(name: "name", selected: false),
      const VotingMember(name: "name", selected: false),
      const VotingMember(name: "name", selected: false),
    ]);
  }

  void toggleSelected(int index) {
    final updateMembers = [...state.votingMembers];
    updateMembers[index] = updateMembers[index].copyWith(
      selected: !updateMembers[index].selected,
    );
    selectCount += updateMembers[index].selected ? 1 : -1;

    // 選択数が上限を超えている場合は更新しない
    if (selectCount > 2) {
      selectCount = 2;
    } else {
      state = state.copyWith(votingMembers: updateMembers);
    }
  }
}
