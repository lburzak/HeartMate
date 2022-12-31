// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileEditorState {
  int? get age => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;
  int? get weight => throw _privateConstructorUsedError;
  Gender? get gender => throw _privateConstructorUsedError;
  Illness? get illness => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  List<String> get otherMedicines => throw _privateConstructorUsedError;
  Anticoagulant get anticoagulant => throw _privateConstructorUsedError;
  InrRange get inrRange => throw _privateConstructorUsedError;
  bool get notificationsEnabled => throw _privateConstructorUsedError;
  TimeOfDay get notificationsTime => throw _privateConstructorUsedError;
  String? get ageError => throw _privateConstructorUsedError;
  String? get heightError => throw _privateConstructorUsedError;
  String? get inrRangeError => throw _privateConstructorUsedError;
  String? get notificationTimeError => throw _privateConstructorUsedError;
  String? get weightError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileEditorStateCopyWith<ProfileEditorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEditorStateCopyWith<$Res> {
  factory $ProfileEditorStateCopyWith(
          ProfileEditorState value, $Res Function(ProfileEditorState) then) =
      _$ProfileEditorStateCopyWithImpl<$Res, ProfileEditorState>;
  @useResult
  $Res call(
      {int? age,
      int? height,
      int? weight,
      Gender? gender,
      Illness? illness,
      String? firstName,
      String? lastName,
      List<String> otherMedicines,
      Anticoagulant anticoagulant,
      InrRange inrRange,
      bool notificationsEnabled,
      TimeOfDay notificationsTime,
      String? ageError,
      String? heightError,
      String? inrRangeError,
      String? notificationTimeError,
      String? weightError});

  $InrRangeCopyWith<$Res> get inrRange;
  $TimeOfDayCopyWith<$Res> get notificationsTime;
}

/// @nodoc
class _$ProfileEditorStateCopyWithImpl<$Res, $Val extends ProfileEditorState>
    implements $ProfileEditorStateCopyWith<$Res> {
  _$ProfileEditorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? age = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? gender = freezed,
    Object? illness = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? otherMedicines = null,
    Object? anticoagulant = null,
    Object? inrRange = null,
    Object? notificationsEnabled = null,
    Object? notificationsTime = null,
    Object? ageError = freezed,
    Object? heightError = freezed,
    Object? inrRangeError = freezed,
    Object? notificationTimeError = freezed,
    Object? weightError = freezed,
  }) {
    return _then(_value.copyWith(
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      illness: freezed == illness
          ? _value.illness
          : illness // ignore: cast_nullable_to_non_nullable
              as Illness?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      otherMedicines: null == otherMedicines
          ? _value.otherMedicines
          : otherMedicines // ignore: cast_nullable_to_non_nullable
              as List<String>,
      anticoagulant: null == anticoagulant
          ? _value.anticoagulant
          : anticoagulant // ignore: cast_nullable_to_non_nullable
              as Anticoagulant,
      inrRange: null == inrRange
          ? _value.inrRange
          : inrRange // ignore: cast_nullable_to_non_nullable
              as InrRange,
      notificationsEnabled: null == notificationsEnabled
          ? _value.notificationsEnabled
          : notificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationsTime: null == notificationsTime
          ? _value.notificationsTime
          : notificationsTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      ageError: freezed == ageError
          ? _value.ageError
          : ageError // ignore: cast_nullable_to_non_nullable
              as String?,
      heightError: freezed == heightError
          ? _value.heightError
          : heightError // ignore: cast_nullable_to_non_nullable
              as String?,
      inrRangeError: freezed == inrRangeError
          ? _value.inrRangeError
          : inrRangeError // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationTimeError: freezed == notificationTimeError
          ? _value.notificationTimeError
          : notificationTimeError // ignore: cast_nullable_to_non_nullable
              as String?,
      weightError: freezed == weightError
          ? _value.weightError
          : weightError // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $InrRangeCopyWith<$Res> get inrRange {
    return $InrRangeCopyWith<$Res>(_value.inrRange, (value) {
      return _then(_value.copyWith(inrRange: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TimeOfDayCopyWith<$Res> get notificationsTime {
    return $TimeOfDayCopyWith<$Res>(_value.notificationsTime, (value) {
      return _then(_value.copyWith(notificationsTime: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProfileEditorStateCopyWith<$Res>
    implements $ProfileEditorStateCopyWith<$Res> {
  factory _$$_ProfileEditorStateCopyWith(_$_ProfileEditorState value,
          $Res Function(_$_ProfileEditorState) then) =
      __$$_ProfileEditorStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? age,
      int? height,
      int? weight,
      Gender? gender,
      Illness? illness,
      String? firstName,
      String? lastName,
      List<String> otherMedicines,
      Anticoagulant anticoagulant,
      InrRange inrRange,
      bool notificationsEnabled,
      TimeOfDay notificationsTime,
      String? ageError,
      String? heightError,
      String? inrRangeError,
      String? notificationTimeError,
      String? weightError});

  @override
  $InrRangeCopyWith<$Res> get inrRange;
  @override
  $TimeOfDayCopyWith<$Res> get notificationsTime;
}

/// @nodoc
class __$$_ProfileEditorStateCopyWithImpl<$Res>
    extends _$ProfileEditorStateCopyWithImpl<$Res, _$_ProfileEditorState>
    implements _$$_ProfileEditorStateCopyWith<$Res> {
  __$$_ProfileEditorStateCopyWithImpl(
      _$_ProfileEditorState _value, $Res Function(_$_ProfileEditorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? age = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? gender = freezed,
    Object? illness = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? otherMedicines = null,
    Object? anticoagulant = null,
    Object? inrRange = null,
    Object? notificationsEnabled = null,
    Object? notificationsTime = null,
    Object? ageError = freezed,
    Object? heightError = freezed,
    Object? inrRangeError = freezed,
    Object? notificationTimeError = freezed,
    Object? weightError = freezed,
  }) {
    return _then(_$_ProfileEditorState(
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      illness: freezed == illness
          ? _value.illness
          : illness // ignore: cast_nullable_to_non_nullable
              as Illness?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      otherMedicines: null == otherMedicines
          ? _value._otherMedicines
          : otherMedicines // ignore: cast_nullable_to_non_nullable
              as List<String>,
      anticoagulant: null == anticoagulant
          ? _value.anticoagulant
          : anticoagulant // ignore: cast_nullable_to_non_nullable
              as Anticoagulant,
      inrRange: null == inrRange
          ? _value.inrRange
          : inrRange // ignore: cast_nullable_to_non_nullable
              as InrRange,
      notificationsEnabled: null == notificationsEnabled
          ? _value.notificationsEnabled
          : notificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationsTime: null == notificationsTime
          ? _value.notificationsTime
          : notificationsTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      ageError: freezed == ageError
          ? _value.ageError
          : ageError // ignore: cast_nullable_to_non_nullable
              as String?,
      heightError: freezed == heightError
          ? _value.heightError
          : heightError // ignore: cast_nullable_to_non_nullable
              as String?,
      inrRangeError: freezed == inrRangeError
          ? _value.inrRangeError
          : inrRangeError // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationTimeError: freezed == notificationTimeError
          ? _value.notificationTimeError
          : notificationTimeError // ignore: cast_nullable_to_non_nullable
              as String?,
      weightError: freezed == weightError
          ? _value.weightError
          : weightError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ProfileEditorState implements _ProfileEditorState {
  const _$_ProfileEditorState(
      {this.age,
      this.height,
      this.weight,
      this.gender,
      this.illness,
      this.firstName,
      this.lastName,
      required final List<String> otherMedicines,
      required this.anticoagulant,
      required this.inrRange,
      required this.notificationsEnabled,
      required this.notificationsTime,
      this.ageError,
      this.heightError,
      this.inrRangeError,
      this.notificationTimeError,
      this.weightError})
      : _otherMedicines = otherMedicines;

  @override
  final int? age;
  @override
  final int? height;
  @override
  final int? weight;
  @override
  final Gender? gender;
  @override
  final Illness? illness;
  @override
  final String? firstName;
  @override
  final String? lastName;
  final List<String> _otherMedicines;
  @override
  List<String> get otherMedicines {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_otherMedicines);
  }

  @override
  final Anticoagulant anticoagulant;
  @override
  final InrRange inrRange;
  @override
  final bool notificationsEnabled;
  @override
  final TimeOfDay notificationsTime;
  @override
  final String? ageError;
  @override
  final String? heightError;
  @override
  final String? inrRangeError;
  @override
  final String? notificationTimeError;
  @override
  final String? weightError;

  @override
  String toString() {
    return 'ProfileEditorState(age: $age, height: $height, weight: $weight, gender: $gender, illness: $illness, firstName: $firstName, lastName: $lastName, otherMedicines: $otherMedicines, anticoagulant: $anticoagulant, inrRange: $inrRange, notificationsEnabled: $notificationsEnabled, notificationsTime: $notificationsTime, ageError: $ageError, heightError: $heightError, inrRangeError: $inrRangeError, notificationTimeError: $notificationTimeError, weightError: $weightError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileEditorState &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.illness, illness) || other.illness == illness) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            const DeepCollectionEquality()
                .equals(other._otherMedicines, _otherMedicines) &&
            (identical(other.anticoagulant, anticoagulant) ||
                other.anticoagulant == anticoagulant) &&
            (identical(other.inrRange, inrRange) ||
                other.inrRange == inrRange) &&
            (identical(other.notificationsEnabled, notificationsEnabled) ||
                other.notificationsEnabled == notificationsEnabled) &&
            (identical(other.notificationsTime, notificationsTime) ||
                other.notificationsTime == notificationsTime) &&
            (identical(other.ageError, ageError) ||
                other.ageError == ageError) &&
            (identical(other.heightError, heightError) ||
                other.heightError == heightError) &&
            (identical(other.inrRangeError, inrRangeError) ||
                other.inrRangeError == inrRangeError) &&
            (identical(other.notificationTimeError, notificationTimeError) ||
                other.notificationTimeError == notificationTimeError) &&
            (identical(other.weightError, weightError) ||
                other.weightError == weightError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      age,
      height,
      weight,
      gender,
      illness,
      firstName,
      lastName,
      const DeepCollectionEquality().hash(_otherMedicines),
      anticoagulant,
      inrRange,
      notificationsEnabled,
      notificationsTime,
      ageError,
      heightError,
      inrRangeError,
      notificationTimeError,
      weightError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileEditorStateCopyWith<_$_ProfileEditorState> get copyWith =>
      __$$_ProfileEditorStateCopyWithImpl<_$_ProfileEditorState>(
          this, _$identity);
}

abstract class _ProfileEditorState implements ProfileEditorState {
  const factory _ProfileEditorState(
      {final int? age,
      final int? height,
      final int? weight,
      final Gender? gender,
      final Illness? illness,
      final String? firstName,
      final String? lastName,
      required final List<String> otherMedicines,
      required final Anticoagulant anticoagulant,
      required final InrRange inrRange,
      required final bool notificationsEnabled,
      required final TimeOfDay notificationsTime,
      final String? ageError,
      final String? heightError,
      final String? inrRangeError,
      final String? notificationTimeError,
      final String? weightError}) = _$_ProfileEditorState;

  @override
  int? get age;
  @override
  int? get height;
  @override
  int? get weight;
  @override
  Gender? get gender;
  @override
  Illness? get illness;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  List<String> get otherMedicines;
  @override
  Anticoagulant get anticoagulant;
  @override
  InrRange get inrRange;
  @override
  bool get notificationsEnabled;
  @override
  TimeOfDay get notificationsTime;
  @override
  String? get ageError;
  @override
  String? get heightError;
  @override
  String? get inrRangeError;
  @override
  String? get notificationTimeError;
  @override
  String? get weightError;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileEditorStateCopyWith<_$_ProfileEditorState> get copyWith =>
      throw _privateConstructorUsedError;
}
