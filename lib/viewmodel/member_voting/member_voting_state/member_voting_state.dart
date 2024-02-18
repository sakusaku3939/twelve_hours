import 'package:freezed_annotation/freezed_annotation.dart';
import 'voting_member.dart';

part 'member_voting_state.freezed.dart';

@freezed
class MemberVotingState with _$MemberVotingState {
  const factory MemberVotingState({
    required List<VotingMember> votingMembers,
  }) = _MemberVotingState;
}
