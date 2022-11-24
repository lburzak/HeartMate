// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dose.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Dose {
  double get potency => throw _privateConstructorUsedError;
  bool get custom => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DoseCopyWith<Dose> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoseCopyWith<$Res> {
  factory $DoseCopyWith(Dose value, $Res Function(Dose) then) =
      _$DoseCopyWithImpl<$Res, Dose>;
  @useResult
  $Res call({double potency, bool custom});
}

/// @nodoc
class _$DoseCopyWithImpl<$Res, $Val extends Dose>
    implements $DoseCopyWith<$Res> {
  _$DoseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? potency = null,
    Object? custom = null,
  }) {
    return _then(_value.copyWith(
      potency: null == potency
          ? _value.potency
          : potency // ignore: cast_nullable_to_non_nullable
              as double,
      custom: null == custom
          ? _value.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$$DoseCopyWith<$Res> implements $DoseCopyWith<$Res> {
  factory _$$$DoseCopyWith(_$$Dose value, $Res Function(_$$Dose) then) =
      __$$$DoseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double potency, bool custom});
}

/// @nodoc
class __$$$DoseCopyWithImpl<$Res> extends _$DoseCopyWithImpl<$Res, _$$Dose>
    implements _$$$DoseCopyWith<$Res> {
  __$$$DoseCopyWithImpl(_$$Dose _value, $Res Function(_$$Dose) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? potency = null,
    Object? custom = null,
  }) {
    return _then(_$$Dose(
      potency: null == potency
          ? _value.potency
          : potency // ignore: cast_nullable_to_non_nullable
              as double,
      custom: null == custom
          ? _value.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$$Dose implements $Dose {
  const _$$Dose({required this.potency, required this.custom});

  @override
  final double potency;
  @override
  final bool custom;

  @override
  String toString() {
    return 'Dose(potency: $potency, custom: $custom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$Dose &&
            (identical(other.potency, potency) || other.potency == potency) &&
            (identical(other.custom, custom) || other.custom == custom));
  }

  @override
  int get hashCode => Object.hash(runtimeType, potency, custom);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$DoseCopyWith<_$$Dose> get copyWith =>
      __$$$DoseCopyWithImpl<_$$Dose>(this, _$identity);
}

abstract class $Dose implements Dose {
  const factory $Dose(
      {required final double potency, required final bool custom}) = _$$Dose;

  @override
  double get potency;
  @override
  bool get custom;
  @override
  @JsonKey(ignore: true)
  _$$$DoseCopyWith<_$$Dose> get copyWith => throw _privateConstructorUsedError;
}
