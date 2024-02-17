// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_timer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProgressTimerState {
  AnimationController? get controller => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProgressTimerStateCopyWith<ProgressTimerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressTimerStateCopyWith<$Res> {
  factory $ProgressTimerStateCopyWith(
          ProgressTimerState value, $Res Function(ProgressTimerState) then) =
      _$ProgressTimerStateCopyWithImpl<$Res, ProgressTimerState>;
  @useResult
  $Res call({AnimationController? controller});
}

/// @nodoc
class _$ProgressTimerStateCopyWithImpl<$Res, $Val extends ProgressTimerState>
    implements $ProgressTimerStateCopyWith<$Res> {
  _$ProgressTimerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = freezed,
  }) {
    return _then(_value.copyWith(
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as AnimationController?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProgressTimerStateImplCopyWith<$Res>
    implements $ProgressTimerStateCopyWith<$Res> {
  factory _$$ProgressTimerStateImplCopyWith(_$ProgressTimerStateImpl value,
          $Res Function(_$ProgressTimerStateImpl) then) =
      __$$ProgressTimerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AnimationController? controller});
}

/// @nodoc
class __$$ProgressTimerStateImplCopyWithImpl<$Res>
    extends _$ProgressTimerStateCopyWithImpl<$Res, _$ProgressTimerStateImpl>
    implements _$$ProgressTimerStateImplCopyWith<$Res> {
  __$$ProgressTimerStateImplCopyWithImpl(_$ProgressTimerStateImpl _value,
      $Res Function(_$ProgressTimerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = freezed,
  }) {
    return _then(_$ProgressTimerStateImpl(
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as AnimationController?,
    ));
  }
}

/// @nodoc

class _$ProgressTimerStateImpl implements _ProgressTimerState {
  const _$ProgressTimerStateImpl({required this.controller});

  @override
  final AnimationController? controller;

  @override
  String toString() {
    return 'ProgressTimerState(controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgressTimerStateImpl &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgressTimerStateImplCopyWith<_$ProgressTimerStateImpl> get copyWith =>
      __$$ProgressTimerStateImplCopyWithImpl<_$ProgressTimerStateImpl>(
          this, _$identity);
}

abstract class _ProgressTimerState implements ProgressTimerState {
  const factory _ProgressTimerState(
          {required final AnimationController? controller}) =
      _$ProgressTimerStateImpl;

  @override
  AnimationController? get controller;
  @override
  @JsonKey(ignore: true)
  _$$ProgressTimerStateImplCopyWith<_$ProgressTimerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
