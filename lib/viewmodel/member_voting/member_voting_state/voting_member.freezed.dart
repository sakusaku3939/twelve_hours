// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voting_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VotingMember {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VotingMemberCopyWith<VotingMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VotingMemberCopyWith<$Res> {
  factory $VotingMemberCopyWith(
          VotingMember value, $Res Function(VotingMember) then) =
      _$VotingMemberCopyWithImpl<$Res, VotingMember>;
  @useResult
  $Res call({String id, String name, String gender, bool selected});
}

/// @nodoc
class _$VotingMemberCopyWithImpl<$Res, $Val extends VotingMember>
    implements $VotingMemberCopyWith<$Res> {
  _$VotingMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? gender = null,
    Object? selected = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VotingMemberImplCopyWith<$Res>
    implements $VotingMemberCopyWith<$Res> {
  factory _$$VotingMemberImplCopyWith(
          _$VotingMemberImpl value, $Res Function(_$VotingMemberImpl) then) =
      __$$VotingMemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String gender, bool selected});
}

/// @nodoc
class __$$VotingMemberImplCopyWithImpl<$Res>
    extends _$VotingMemberCopyWithImpl<$Res, _$VotingMemberImpl>
    implements _$$VotingMemberImplCopyWith<$Res> {
  __$$VotingMemberImplCopyWithImpl(
      _$VotingMemberImpl _value, $Res Function(_$VotingMemberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? gender = null,
    Object? selected = null,
  }) {
    return _then(_$VotingMemberImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$VotingMemberImpl implements _VotingMember {
  const _$VotingMemberImpl(
      {required this.id,
      required this.name,
      required this.gender,
      required this.selected});

  @override
  final String id;
  @override
  final String name;
  @override
  final String gender;
  @override
  final bool selected;

  @override
  String toString() {
    return 'VotingMember(id: $id, name: $name, gender: $gender, selected: $selected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VotingMemberImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, gender, selected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VotingMemberImplCopyWith<_$VotingMemberImpl> get copyWith =>
      __$$VotingMemberImplCopyWithImpl<_$VotingMemberImpl>(this, _$identity);
}

abstract class _VotingMember implements VotingMember {
  const factory _VotingMember(
      {required final String id,
      required final String name,
      required final String gender,
      required final bool selected}) = _$VotingMemberImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get gender;
  @override
  bool get selected;
  @override
  @JsonKey(ignore: true)
  _$$VotingMemberImplCopyWith<_$VotingMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
