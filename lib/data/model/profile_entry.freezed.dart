// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileEntry _$ProfileEntryFromJson(Map<String, dynamic> json) {
  return _ProfileEntry.fromJson(json);
}

/// @nodoc
mixin _$ProfileEntry {
  DateTime get createdAt => throw _privateConstructorUsedError;
  Profile get profile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileEntryCopyWith<ProfileEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEntryCopyWith<$Res> {
  factory $ProfileEntryCopyWith(
          ProfileEntry value, $Res Function(ProfileEntry) then) =
      _$ProfileEntryCopyWithImpl<$Res, ProfileEntry>;
  @useResult
  $Res call({DateTime createdAt, Profile profile});

  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class _$ProfileEntryCopyWithImpl<$Res, $Val extends ProfileEntry>
    implements $ProfileEntryCopyWith<$Res> {
  _$ProfileEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? profile = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProfileEntryCopyWith<$Res>
    implements $ProfileEntryCopyWith<$Res> {
  factory _$$_ProfileEntryCopyWith(
          _$_ProfileEntry value, $Res Function(_$_ProfileEntry) then) =
      __$$_ProfileEntryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime createdAt, Profile profile});

  @override
  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$$_ProfileEntryCopyWithImpl<$Res>
    extends _$ProfileEntryCopyWithImpl<$Res, _$_ProfileEntry>
    implements _$$_ProfileEntryCopyWith<$Res> {
  __$$_ProfileEntryCopyWithImpl(
      _$_ProfileEntry _value, $Res Function(_$_ProfileEntry) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? profile = null,
  }) {
    return _then(_$_ProfileEntry(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProfileEntry implements _ProfileEntry {
  const _$_ProfileEntry({required this.createdAt, required this.profile});

  factory _$_ProfileEntry.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileEntryFromJson(json);

  @override
  final DateTime createdAt;
  @override
  final Profile profile;

  @override
  String toString() {
    return 'ProfileEntry(createdAt: $createdAt, profile: $profile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileEntry &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, createdAt, profile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileEntryCopyWith<_$_ProfileEntry> get copyWith =>
      __$$_ProfileEntryCopyWithImpl<_$_ProfileEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileEntryToJson(
      this,
    );
  }
}

abstract class _ProfileEntry implements ProfileEntry {
  const factory _ProfileEntry(
      {required final DateTime createdAt,
      required final Profile profile}) = _$_ProfileEntry;

  factory _ProfileEntry.fromJson(Map<String, dynamic> json) =
      _$_ProfileEntry.fromJson;

  @override
  DateTime get createdAt;
  @override
  Profile get profile;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileEntryCopyWith<_$_ProfileEntry> get copyWith =>
      throw _privateConstructorUsedError;
}
