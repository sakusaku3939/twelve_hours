// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_voting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MemberVotingState {
  List<VotingMember> get votingMembers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MemberVotingStateCopyWith<MemberVotingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberVotingStateCopyWith<$Res> {
  factory $MemberVotingStateCopyWith(
          MemberVotingState value, $Res Function(MemberVotingState) then) =
      _$MemberVotingStateCopyWithImpl<$Res, MemberVotingState>;
  @useResult
  $Res call({List<VotingMember> votingMembers});
}

/// @nodoc
class _$MemberVotingStateCopyWithImpl<$Res, $Val extends MemberVotingState>
    implements $MemberVotingStateCopyWith<$Res> {
  _$MemberVotingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? votingMembers = null,
  }) {
    return _then(_value.copyWith(
      votingMembers: null == votingMembers
          ? _value.votingMembers
          : votingMembers // ignore: cast_nullable_to_non_nullable
              as List<VotingMember>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemberVotingStateImplCopyWith<$Res>
    implements $MemberVotingStateCopyWith<$Res> {
  factory _$$MemberVotingStateImplCopyWith(_$MemberVotingStateImpl value,
          $Res Function(_$MemberVotingStateImpl) then) =
      __$$MemberVotingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<VotingMember> votingMembers});
}

/// @nodoc
class __$$MemberVotingStateImplCopyWithImpl<$Res>
    extends _$MemberVotingStateCopyWithImpl<$Res, _$MemberVotingStateImpl>
    implements _$$MemberVotingStateImplCopyWith<$Res> {
  __$$MemberVotingStateImplCopyWithImpl(_$MemberVotingStateImpl _value,
      $Res Function(_$MemberVotingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? votingMembers = null,
  }) {
    return _then(_$MemberVotingStateImpl(
      votingMembers: null == votingMembers
          ? _value._votingMembers
          : votingMembers // ignore: cast_nullable_to_non_nullable
              as List<VotingMember>,
    ));
  }
}

/// @nodoc

class _$MemberVotingStateImpl implements _MemberVotingState {
  const _$MemberVotingStateImpl(
      {required final List<VotingMember> votingMembers})
      : _votingMembers = votingMembers;

  final List<VotingMember> _votingMembers;
  @override
  List<VotingMember> get votingMembers {
    if (_votingMembers is EqualUnmodifiableListView) return _votingMembers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_votingMembers);
  }

  @override
  String toString() {
    return 'MemberVotingState(votingMembers: $votingMembers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberVotingStateImpl &&
            const DeepCollectionEquality()
                .equals(other._votingMembers, _votingMembers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_votingMembers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberVotingStateImplCopyWith<_$MemberVotingStateImpl> get copyWith =>
      __$$MemberVotingStateImplCopyWithImpl<_$MemberVotingStateImpl>(
          this, _$identity);
}

abstract class _MemberVotingState implements MemberVotingState {
  const factory _MemberVotingState(
          {required final List<VotingMember> votingMembers}) =
      _$MemberVotingStateImpl;

  @override
  List<VotingMember> get votingMembers;
  @override
  @JsonKey(ignore: true)
  _$$MemberVotingStateImplCopyWith<_$MemberVotingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
