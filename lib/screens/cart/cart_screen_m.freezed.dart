// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cart_screen_m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartScreenState {
  bool get isBusy => throw _privateConstructorUsedError;
  List<HomeDatabase> get data => throw _privateConstructorUsedError;
  int get grandTotal => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isBusy, List<HomeDatabase> data, int grandTotal)
        initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isBusy, List<HomeDatabase> data, int grandTotal)?
        initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isBusy, List<HomeDatabase> data, int grandTotal)?
        initialize,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartScreenStateCopyWith<CartScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartScreenStateCopyWith<$Res> {
  factory $CartScreenStateCopyWith(
          CartScreenState value, $Res Function(CartScreenState) then) =
      _$CartScreenStateCopyWithImpl<$Res>;
  $Res call({bool isBusy, List<HomeDatabase> data, int grandTotal});
}

/// @nodoc
class _$CartScreenStateCopyWithImpl<$Res>
    implements $CartScreenStateCopyWith<$Res> {
  _$CartScreenStateCopyWithImpl(this._value, this._then);

  final CartScreenState _value;
  // ignore: unused_field
  final $Res Function(CartScreenState) _then;

  @override
  $Res call({
    Object? isBusy = freezed,
    Object? data = freezed,
    Object? grandTotal = freezed,
  }) {
    return _then(_value.copyWith(
      isBusy: isBusy == freezed
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<HomeDatabase>,
      grandTotal: grandTotal == freezed
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$InitializeCopyWith<$Res>
    implements $CartScreenStateCopyWith<$Res> {
  factory _$$InitializeCopyWith(
          _$Initialize value, $Res Function(_$Initialize) then) =
      __$$InitializeCopyWithImpl<$Res>;
  @override
  $Res call({bool isBusy, List<HomeDatabase> data, int grandTotal});
}

/// @nodoc
class __$$InitializeCopyWithImpl<$Res>
    extends _$CartScreenStateCopyWithImpl<$Res>
    implements _$$InitializeCopyWith<$Res> {
  __$$InitializeCopyWithImpl(
      _$Initialize _value, $Res Function(_$Initialize) _then)
      : super(_value, (v) => _then(v as _$Initialize));

  @override
  _$Initialize get _value => super._value as _$Initialize;

  @override
  $Res call({
    Object? isBusy = freezed,
    Object? data = freezed,
    Object? grandTotal = freezed,
  }) {
    return _then(_$Initialize(
      isBusy: isBusy == freezed
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      data: data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<HomeDatabase>,
      grandTotal: grandTotal == freezed
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$Initialize implements Initialize {
  const _$Initialize(
      {required this.isBusy,
      required final List<HomeDatabase> data,
      required this.grandTotal})
      : _data = data;

  @override
  final bool isBusy;
  final List<HomeDatabase> _data;
  @override
  List<HomeDatabase> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int grandTotal;

  @override
  String toString() {
    return 'CartScreenState.initialize(isBusy: $isBusy, data: $data, grandTotal: $grandTotal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initialize &&
            const DeepCollectionEquality().equals(other.isBusy, isBusy) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality()
                .equals(other.grandTotal, grandTotal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isBusy),
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(grandTotal));

  @JsonKey(ignore: true)
  @override
  _$$InitializeCopyWith<_$Initialize> get copyWith =>
      __$$InitializeCopyWithImpl<_$Initialize>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isBusy, List<HomeDatabase> data, int grandTotal)
        initialize,
  }) {
    return initialize(isBusy, data, grandTotal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isBusy, List<HomeDatabase> data, int grandTotal)?
        initialize,
  }) {
    return initialize?.call(isBusy, data, grandTotal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isBusy, List<HomeDatabase> data, int grandTotal)?
        initialize,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(isBusy, data, grandTotal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class Initialize implements CartScreenState {
  const factory Initialize(
      {required final bool isBusy,
      required final List<HomeDatabase> data,
      required final int grandTotal}) = _$Initialize;

  @override
  bool get isBusy;
  @override
  List<HomeDatabase> get data;
  @override
  int get grandTotal;
  @override
  @JsonKey(ignore: true)
  _$$InitializeCopyWith<_$Initialize> get copyWith =>
      throw _privateConstructorUsedError;
}
