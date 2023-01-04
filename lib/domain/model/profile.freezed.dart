// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;
  int? get weight => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  Gender? get gender => throw _privateConstructorUsedError;
  Illness? get illness => throw _privateConstructorUsedError;
  Anticoagulant get anticoagulant => throw _privateConstructorUsedError;
  InrRange get inrRange => throw _privateConstructorUsedError;
  List<String> get otherMedicines => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {String? firstName,
      String? lastName,
      int? height,
      int? weight,
      int? age,
      Gender? gender,
      Illness? illness,
      Anticoagulant anticoagulant,
      InrRange inrRange,
      List<String> otherMedicines});

  $InrRangeCopyWith<$Res> get inrRange;
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? illness = freezed,
    Object? anticoagulant = null,
    Object? inrRange = null,
    Object? otherMedicines = null,
  }) {
    return _then(_value.copyWith(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      illness: freezed == illness
          ? _value.illness
          : illness // ignore: cast_nullable_to_non_nullable
              as Illness?,
      anticoagulant: null == anticoagulant
          ? _value.anticoagulant
          : anticoagulant // ignore: cast_nullable_to_non_nullable
              as Anticoagulant,
      inrRange: null == inrRange
          ? _value.inrRange
          : inrRange // ignore: cast_nullable_to_non_nullable
              as InrRange,
      otherMedicines: null == otherMedicines
          ? _value.otherMedicines
          : otherMedicines // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $InrRangeCopyWith<$Res> get inrRange {
    return $InrRangeCopyWith<$Res>(_value.inrRange, (value) {
      return _then(_value.copyWith(inrRange: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$_ProfileCopyWith(
          _$_Profile value, $Res Function(_$_Profile) then) =
      __$$_ProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? firstName,
      String? lastName,
      int? height,
      int? weight,
      int? age,
      Gender? gender,
      Illness? illness,
      Anticoagulant anticoagulant,
      InrRange inrRange,
      List<String> otherMedicines});

  @override
  $InrRangeCopyWith<$Res> get inrRange;
}

/// @nodoc
class __$$_ProfileCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$_Profile>
    implements _$$_ProfileCopyWith<$Res> {
  __$$_ProfileCopyWithImpl(_$_Profile _value, $Res Function(_$_Profile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? illness = freezed,
    Object? anticoagulant = null,
    Object? inrRange = null,
    Object? otherMedicines = null,
  }) {
    return _then(_$_Profile(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      illness: freezed == illness
          ? _value.illness
          : illness // ignore: cast_nullable_to_non_nullable
              as Illness?,
      anticoagulant: null == anticoagulant
          ? _value.anticoagulant
          : anticoagulant // ignore: cast_nullable_to_non_nullable
              as Anticoagulant,
      inrRange: null == inrRange
          ? _value.inrRange
          : inrRange // ignore: cast_nullable_to_non_nullable
              as InrRange,
      otherMedicines: null == otherMedicines
          ? _value._otherMedicines
          : otherMedicines // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Profile implements _Profile {
  const _$_Profile(
      {this.firstName,
      this.lastName,
      this.height,
      this.weight,
      this.age,
      this.gender,
      this.illness,
      required this.anticoagulant,
      required this.inrRange,
      required final List<String> otherMedicines})
      : _otherMedicines = otherMedicines;

  factory _$_Profile.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileFromJson(json);

  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final int? height;
  @override
  final int? weight;
  @override
  final int? age;
  @override
  final Gender? gender;
  @override
  final Illness? illness;
  @override
  final Anticoagulant anticoagulant;
  @override
  final InrRange inrRange;
  final List<String> _otherMedicines;
  @override
  List<String> get otherMedicines {
    if (_otherMedicines is EqualUnmodifiableListView) return _otherMedicines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_otherMedicines);
  }

  @override
  String toString() {
    return 'Profile(firstName: $firstName, lastName: $lastName, height: $height, weight: $weight, age: $age, gender: $gender, illness: $illness, anticoagulant: $anticoagulant, inrRange: $inrRange, otherMedicines: $otherMedicines)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Profile &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.illness, illness) || other.illness == illness) &&
            (identical(other.anticoagulant, anticoagulant) ||
                other.anticoagulant == anticoagulant) &&
            (identical(other.inrRange, inrRange) ||
                other.inrRange == inrRange) &&
            const DeepCollectionEquality()
                .equals(other._otherMedicines, _otherMedicines));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      height,
      weight,
      age,
      gender,
      illness,
      anticoagulant,
      inrRange,
      const DeepCollectionEquality().hash(_otherMedicines));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileCopyWith<_$_Profile> get copyWith =>
      __$$_ProfileCopyWithImpl<_$_Profile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileToJson(
      this,
    );
  }
}

abstract class _Profile implements Profile {
  const factory _Profile(
      {final String? firstName,
      final String? lastName,
      final int? height,
      final int? weight,
      final int? age,
      final Gender? gender,
      final Illness? illness,
      required final Anticoagulant anticoagulant,
      required final InrRange inrRange,
      required final List<String> otherMedicines}) = _$_Profile;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$_Profile.fromJson;

  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  int? get height;
  @override
  int? get weight;
  @override
  int? get age;
  @override
  Gender? get gender;
  @override
  Illness? get illness;
  @override
  Anticoagulant get anticoagulant;
  @override
  InrRange get inrRange;
  @override
  List<String> get otherMedicines;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileCopyWith<_$_Profile> get copyWith =>
      throw _privateConstructorUsedError;
}
