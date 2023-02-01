// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journal_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$JournalEntry {
  DateTime get date => throw _privateConstructorUsedError;
  Anticoagulant? get anticoagulant => throw _privateConstructorUsedError;
  double? get scheduledDose => throw _privateConstructorUsedError;
  double? get takenDose => throw _privateConstructorUsedError;
  List<String> get otherMedicines => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JournalEntryCopyWith<JournalEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalEntryCopyWith<$Res> {
  factory $JournalEntryCopyWith(
          JournalEntry value, $Res Function(JournalEntry) then) =
      _$JournalEntryCopyWithImpl<$Res, JournalEntry>;
  @useResult
  $Res call(
      {DateTime date,
      Anticoagulant? anticoagulant,
      double? scheduledDose,
      double? takenDose,
      List<String> otherMedicines});
}

/// @nodoc
class _$JournalEntryCopyWithImpl<$Res, $Val extends JournalEntry>
    implements $JournalEntryCopyWith<$Res> {
  _$JournalEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? anticoagulant = freezed,
    Object? scheduledDose = freezed,
    Object? takenDose = freezed,
    Object? otherMedicines = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      anticoagulant: freezed == anticoagulant
          ? _value.anticoagulant
          : anticoagulant // ignore: cast_nullable_to_non_nullable
              as Anticoagulant?,
      scheduledDose: freezed == scheduledDose
          ? _value.scheduledDose
          : scheduledDose // ignore: cast_nullable_to_non_nullable
              as double?,
      takenDose: freezed == takenDose
          ? _value.takenDose
          : takenDose // ignore: cast_nullable_to_non_nullable
              as double?,
      otherMedicines: null == otherMedicines
          ? _value.otherMedicines
          : otherMedicines // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_JournalEntryCopyWith<$Res>
    implements $JournalEntryCopyWith<$Res> {
  factory _$$_JournalEntryCopyWith(
          _$_JournalEntry value, $Res Function(_$_JournalEntry) then) =
      __$$_JournalEntryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      Anticoagulant? anticoagulant,
      double? scheduledDose,
      double? takenDose,
      List<String> otherMedicines});
}

/// @nodoc
class __$$_JournalEntryCopyWithImpl<$Res>
    extends _$JournalEntryCopyWithImpl<$Res, _$_JournalEntry>
    implements _$$_JournalEntryCopyWith<$Res> {
  __$$_JournalEntryCopyWithImpl(
      _$_JournalEntry _value, $Res Function(_$_JournalEntry) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? anticoagulant = freezed,
    Object? scheduledDose = freezed,
    Object? takenDose = freezed,
    Object? otherMedicines = null,
  }) {
    return _then(_$_JournalEntry(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      anticoagulant: freezed == anticoagulant
          ? _value.anticoagulant
          : anticoagulant // ignore: cast_nullable_to_non_nullable
              as Anticoagulant?,
      scheduledDose: freezed == scheduledDose
          ? _value.scheduledDose
          : scheduledDose // ignore: cast_nullable_to_non_nullable
              as double?,
      takenDose: freezed == takenDose
          ? _value.takenDose
          : takenDose // ignore: cast_nullable_to_non_nullable
              as double?,
      otherMedicines: null == otherMedicines
          ? _value._otherMedicines
          : otherMedicines // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_JournalEntry implements _JournalEntry {
  const _$_JournalEntry(
      {required this.date,
      this.anticoagulant,
      this.scheduledDose,
      this.takenDose,
      required final List<String> otherMedicines})
      : _otherMedicines = otherMedicines;

  @override
  final DateTime date;
  @override
  final Anticoagulant? anticoagulant;
  @override
  final double? scheduledDose;
  @override
  final double? takenDose;
  final List<String> _otherMedicines;
  @override
  List<String> get otherMedicines {
    if (_otherMedicines is EqualUnmodifiableListView) return _otherMedicines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_otherMedicines);
  }

  @override
  String toString() {
    return 'JournalEntry(date: $date, anticoagulant: $anticoagulant, scheduledDose: $scheduledDose, takenDose: $takenDose, otherMedicines: $otherMedicines)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JournalEntry &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.anticoagulant, anticoagulant) ||
                other.anticoagulant == anticoagulant) &&
            (identical(other.scheduledDose, scheduledDose) ||
                other.scheduledDose == scheduledDose) &&
            (identical(other.takenDose, takenDose) ||
                other.takenDose == takenDose) &&
            const DeepCollectionEquality()
                .equals(other._otherMedicines, _otherMedicines));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      anticoagulant,
      scheduledDose,
      takenDose,
      const DeepCollectionEquality().hash(_otherMedicines));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JournalEntryCopyWith<_$_JournalEntry> get copyWith =>
      __$$_JournalEntryCopyWithImpl<_$_JournalEntry>(this, _$identity);
}

abstract class _JournalEntry implements JournalEntry {
  const factory _JournalEntry(
      {required final DateTime date,
      final Anticoagulant? anticoagulant,
      final double? scheduledDose,
      final double? takenDose,
      required final List<String> otherMedicines}) = _$_JournalEntry;

  @override
  DateTime get date;
  @override
  Anticoagulant? get anticoagulant;
  @override
  double? get scheduledDose;
  @override
  double? get takenDose;
  @override
  List<String> get otherMedicines;
  @override
  @JsonKey(ignore: true)
  _$$_JournalEntryCopyWith<_$_JournalEntry> get copyWith =>
      throw _privateConstructorUsedError;
}
