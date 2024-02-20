// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_card_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RoomCardState {
  List<RoomTable> get rooms => throw _privateConstructorUsedError;
  List<bool> get has12hoursPassed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoomCardStateCopyWith<RoomCardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomCardStateCopyWith<$Res> {
  factory $RoomCardStateCopyWith(
          RoomCardState value, $Res Function(RoomCardState) then) =
      _$RoomCardStateCopyWithImpl<$Res, RoomCardState>;
  @useResult
  $Res call({List<RoomTable> rooms, List<bool> has12hoursPassed});
}

/// @nodoc
class _$RoomCardStateCopyWithImpl<$Res, $Val extends RoomCardState>
    implements $RoomCardStateCopyWith<$Res> {
  _$RoomCardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rooms = null,
    Object? has12hoursPassed = null,
  }) {
    return _then(_value.copyWith(
      rooms: null == rooms
          ? _value.rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<RoomTable>,
      has12hoursPassed: null == has12hoursPassed
          ? _value.has12hoursPassed
          : has12hoursPassed // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomCardStateImplCopyWith<$Res>
    implements $RoomCardStateCopyWith<$Res> {
  factory _$$RoomCardStateImplCopyWith(
          _$RoomCardStateImpl value, $Res Function(_$RoomCardStateImpl) then) =
      __$$RoomCardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RoomTable> rooms, List<bool> has12hoursPassed});
}

/// @nodoc
class __$$RoomCardStateImplCopyWithImpl<$Res>
    extends _$RoomCardStateCopyWithImpl<$Res, _$RoomCardStateImpl>
    implements _$$RoomCardStateImplCopyWith<$Res> {
  __$$RoomCardStateImplCopyWithImpl(
      _$RoomCardStateImpl _value, $Res Function(_$RoomCardStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rooms = null,
    Object? has12hoursPassed = null,
  }) {
    return _then(_$RoomCardStateImpl(
      rooms: null == rooms
          ? _value._rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<RoomTable>,
      has12hoursPassed: null == has12hoursPassed
          ? _value._has12hoursPassed
          : has12hoursPassed // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ));
  }
}

/// @nodoc

class _$RoomCardStateImpl implements _RoomCardState {
  const _$RoomCardStateImpl(
      {required final List<RoomTable> rooms,
      required final List<bool> has12hoursPassed})
      : _rooms = rooms,
        _has12hoursPassed = has12hoursPassed;

  final List<RoomTable> _rooms;
  @override
  List<RoomTable> get rooms {
    if (_rooms is EqualUnmodifiableListView) return _rooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rooms);
  }

  final List<bool> _has12hoursPassed;
  @override
  List<bool> get has12hoursPassed {
    if (_has12hoursPassed is EqualUnmodifiableListView)
      return _has12hoursPassed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_has12hoursPassed);
  }

  @override
  String toString() {
    return 'RoomCardState(rooms: $rooms, has12hoursPassed: $has12hoursPassed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomCardStateImpl &&
            const DeepCollectionEquality().equals(other._rooms, _rooms) &&
            const DeepCollectionEquality()
                .equals(other._has12hoursPassed, _has12hoursPassed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_rooms),
      const DeepCollectionEquality().hash(_has12hoursPassed));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomCardStateImplCopyWith<_$RoomCardStateImpl> get copyWith =>
      __$$RoomCardStateImplCopyWithImpl<_$RoomCardStateImpl>(this, _$identity);
}

abstract class _RoomCardState implements RoomCardState {
  const factory _RoomCardState(
      {required final List<RoomTable> rooms,
      required final List<bool> has12hoursPassed}) = _$RoomCardStateImpl;

  @override
  List<RoomTable> get rooms;
  @override
  List<bool> get has12hoursPassed;
  @override
  @JsonKey(ignore: true)
  _$$RoomCardStateImplCopyWith<_$RoomCardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
