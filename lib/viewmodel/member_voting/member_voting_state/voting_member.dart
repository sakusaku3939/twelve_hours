import 'package:freezed_annotation/freezed_annotation.dart';

part 'voting_member.freezed.dart';

@freezed
class VotingMember with _$VotingMember {
  const factory VotingMember({
    required int id,
    required String name,
    required String gender,
    required bool selected,
  }) = _VotingMember;
}