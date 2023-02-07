// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DaySummary {
  double? get dosage => throw _privateConstructorUsedError;
  Anticoagulant? get anticoagulant => throw _privateConstructorUsedError;
  bool? get taken => throw _privateConstructorUsedError;
  List<String>? get otherMedicines => throw _privateConstructorUsedError;
  double? get inr => throw _privateConstructorUsedError;
  InrRating? get inrRating => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DaySummaryCopyWith<DaySummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DaySummaryCopyWith<$Res> {
  factory $DaySummaryCopyWith(
          DaySummary value, $Res Function(DaySummary) then) =
      _$DaySummaryCopyWithImpl<$Res, DaySummary>;
  @useResult
  $Res call(
      {double? dosage,
      Anticoagulant? anticoagulant,
      bool? taken,
      List<String>? otherMedicines,
      double? inr,
      InrRating? inrRating,
      String? note});
}

/// @nodoc
class _$DaySummaryCopyWithImpl<$Res, $Val extends DaySummary>
    implements $DaySummaryCopyWith<$Res> {
  _$DaySummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dosage = freezed,
    Object? anticoagulant = freezed,
    Object? taken = freezed,
    Object? otherMedicines = freezed,
    Object? inr = freezed,
    Object? inrRating = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      dosage: freezed == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as double?,
      anticoagulant: freezed == anticoagulant
          ? _value.anticoagulant
          : anticoagulant // ignore: cast_nullable_to_non_nullable
              as Anticoagulant?,
      taken: freezed == taken
          ? _value.taken
          : taken // ignore: cast_nullable_to_non_nullable
              as bool?,
      otherMedicines: freezed == otherMedicines
          ? _value.otherMedicines
          : otherMedicines // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      inr: freezed == inr
          ? _value.inr
          : inr // ignore: cast_nullable_to_non_nullable
              as double?,
      inrRating: freezed == inrRating
          ? _value.inrRating
          : inrRating // ignore: cast_nullable_to_non_nullable
              as InrRating?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DaySummaryCopyWith<$Res>
    implements $DaySummaryCopyWith<$Res> {
  factory _$$_DaySummaryCopyWith(
          _$_DaySummary value, $Res Function(_$_DaySummary) then) =
      __$$_DaySummaryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? dosage,
      Anticoagulant? anticoagulant,
      bool? taken,
      List<String>? otherMedicines,
      double? inr,
      InrRating? inrRating,
      String? note});
}

/// @nodoc
class __$$_DaySummaryCopyWithImpl<$Res>
    extends _$DaySummaryCopyWithImpl<$Res, _$_DaySummary>
    implements _$$_DaySummaryCopyWith<$Res> {
  __$$_DaySummaryCopyWithImpl(
      _$_DaySummary _value, $Res Function(_$_DaySummary) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dosage = freezed,
    Object? anticoagulant = freezed,
    Object? taken = freezed,
    Object? otherMedicines = freezed,
    Object? inr = freezed,
    Object? inrRating = freezed,
    Object? note = freezed,
  }) {
    return _then(_$_DaySummary(
      dosage: freezed == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as double?,
      anticoagulant: freezed == anticoagulant
          ? _value.anticoagulant
          : anticoagulant // ignore: cast_nullable_to_non_nullable
              as Anticoagulant?,
      taken: freezed == taken
          ? _value.taken
          : taken // ignore: cast_nullable_to_non_nullable
              as bool?,
      otherMedicines: freezed == otherMedicines
          ? _value._otherMedicines
          : otherMedicines // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      inr: freezed == inr
          ? _value.inr
          : inr // ignore: cast_nullable_to_non_nullable
              as double?,
      inrRating: freezed == inrRating
          ? _value.inrRating
          : inrRating // ignore: cast_nullable_to_non_nullable
              as InrRating?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_DaySummary implements _DaySummary {
  const _$_DaySummary(
      {this.dosage,
      this.anticoagulant,
      this.taken,
      final List<String>? otherMedicines,
      this.inr,
      this.inrRating,
      this.note})
      : _otherMedicines = otherMedicines;

  @override
  final double? dosage;
  @override
  final Anticoagulant? anticoagulant;
  @override
  final bool? taken;
  final List<String>? _otherMedicines;
  @override
  List<String>? get otherMedicines {
    final value = _otherMedicines;
    if (value == null) return null;
    if (_otherMedicines is EqualUnmodifiableListView) return _otherMedicines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? inr;
  @override
  final InrRating? inrRating;
  @override
  final String? note;

  @override
  String toString() {
    return 'DaySummary(dosage: $dosage, anticoagulant: $anticoagulant, taken: $taken, otherMedicines: $otherMedicines, inr: $inr, inrRating: $inrRating, note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DaySummary &&
            (identical(other.dosage, dosage) || other.dosage == dosage) &&
            (identical(other.anticoagulant, anticoagulant) ||
                other.anticoagulant == anticoagulant) &&
            (identical(other.taken, taken) || other.taken == taken) &&
            const DeepCollectionEquality()
                .equals(other._otherMedicines, _otherMedicines) &&
            (identical(other.inr, inr) || other.inr == inr) &&
            (identical(other.inrRating, inrRating) ||
                other.inrRating == inrRating) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      dosage,
      anticoagulant,
      taken,
      const DeepCollectionEquality().hash(_otherMedicines),
      inr,
      inrRating,
      note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DaySummaryCopyWith<_$_DaySummary> get copyWith =>
      __$$_DaySummaryCopyWithImpl<_$_DaySummary>(this, _$identity);
}

abstract class _DaySummary implements DaySummary {
  const factory _DaySummary(
      {final double? dosage,
      final Anticoagulant? anticoagulant,
      final bool? taken,
      final List<String>? otherMedicines,
      final double? inr,
      final InrRating? inrRating,
      final String? note}) = _$_DaySummary;

  @override
  double? get dosage;
  @override
  Anticoagulant? get anticoagulant;
  @override
  bool? get taken;
  @override
  List<String>? get otherMedicines;
  @override
  double? get inr;
  @override
  InrRating? get inrRating;
  @override
  String? get note;
  @override
  @JsonKey(ignore: true)
  _$$_DaySummaryCopyWith<_$_DaySummary> get copyWith =>
      throw _privateConstructorUsedError;
}
