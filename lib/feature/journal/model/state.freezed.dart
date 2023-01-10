// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$JournalState {
  DateTime? get selectedDay => throw _privateConstructorUsedError;
  DaySummary? get selectedDaySummary => throw _privateConstructorUsedError;
  Map<DateTime, DayHighlight>? get selectedMonthHighlights =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JournalStateCopyWith<JournalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalStateCopyWith<$Res> {
  factory $JournalStateCopyWith(
          JournalState value, $Res Function(JournalState) then) =
      _$JournalStateCopyWithImpl<$Res, JournalState>;
  @useResult
  $Res call(
      {DateTime? selectedDay,
      DaySummary? selectedDaySummary,
      Map<DateTime, DayHighlight>? selectedMonthHighlights});

  $DaySummaryCopyWith<$Res>? get selectedDaySummary;
}

/// @nodoc
class _$JournalStateCopyWithImpl<$Res, $Val extends JournalState>
    implements $JournalStateCopyWith<$Res> {
  _$JournalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDay = freezed,
    Object? selectedDaySummary = freezed,
    Object? selectedMonthHighlights = freezed,
  }) {
    return _then(_value.copyWith(
      selectedDay: freezed == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedDaySummary: freezed == selectedDaySummary
          ? _value.selectedDaySummary
          : selectedDaySummary // ignore: cast_nullable_to_non_nullable
              as DaySummary?,
      selectedMonthHighlights: freezed == selectedMonthHighlights
          ? _value.selectedMonthHighlights
          : selectedMonthHighlights // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, DayHighlight>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DaySummaryCopyWith<$Res>? get selectedDaySummary {
    if (_value.selectedDaySummary == null) {
      return null;
    }

    return $DaySummaryCopyWith<$Res>(_value.selectedDaySummary!, (value) {
      return _then(_value.copyWith(selectedDaySummary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_JournalStateCopyWith<$Res>
    implements $JournalStateCopyWith<$Res> {
  factory _$$_JournalStateCopyWith(
          _$_JournalState value, $Res Function(_$_JournalState) then) =
      __$$_JournalStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? selectedDay,
      DaySummary? selectedDaySummary,
      Map<DateTime, DayHighlight>? selectedMonthHighlights});

  @override
  $DaySummaryCopyWith<$Res>? get selectedDaySummary;
}

/// @nodoc
class __$$_JournalStateCopyWithImpl<$Res>
    extends _$JournalStateCopyWithImpl<$Res, _$_JournalState>
    implements _$$_JournalStateCopyWith<$Res> {
  __$$_JournalStateCopyWithImpl(
      _$_JournalState _value, $Res Function(_$_JournalState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDay = freezed,
    Object? selectedDaySummary = freezed,
    Object? selectedMonthHighlights = freezed,
  }) {
    return _then(_$_JournalState(
      selectedDay: freezed == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedDaySummary: freezed == selectedDaySummary
          ? _value.selectedDaySummary
          : selectedDaySummary // ignore: cast_nullable_to_non_nullable
              as DaySummary?,
      selectedMonthHighlights: freezed == selectedMonthHighlights
          ? _value._selectedMonthHighlights
          : selectedMonthHighlights // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, DayHighlight>?,
    ));
  }
}

/// @nodoc

class _$_JournalState implements _JournalState {
  const _$_JournalState(
      {this.selectedDay,
      this.selectedDaySummary,
      final Map<DateTime, DayHighlight>? selectedMonthHighlights})
      : _selectedMonthHighlights = selectedMonthHighlights;

  @override
  final DateTime? selectedDay;
  @override
  final DaySummary? selectedDaySummary;
  final Map<DateTime, DayHighlight>? _selectedMonthHighlights;
  @override
  Map<DateTime, DayHighlight>? get selectedMonthHighlights {
    final value = _selectedMonthHighlights;
    if (value == null) return null;
    if (_selectedMonthHighlights is EqualUnmodifiableMapView)
      return _selectedMonthHighlights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'JournalState(selectedDay: $selectedDay, selectedDaySummary: $selectedDaySummary, selectedMonthHighlights: $selectedMonthHighlights)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JournalState &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            (identical(other.selectedDaySummary, selectedDaySummary) ||
                other.selectedDaySummary == selectedDaySummary) &&
            const DeepCollectionEquality().equals(
                other._selectedMonthHighlights, _selectedMonthHighlights));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedDay, selectedDaySummary,
      const DeepCollectionEquality().hash(_selectedMonthHighlights));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JournalStateCopyWith<_$_JournalState> get copyWith =>
      __$$_JournalStateCopyWithImpl<_$_JournalState>(this, _$identity);
}

abstract class _JournalState implements JournalState {
  const factory _JournalState(
          {final DateTime? selectedDay,
          final DaySummary? selectedDaySummary,
          final Map<DateTime, DayHighlight>? selectedMonthHighlights}) =
      _$_JournalState;

  @override
  DateTime? get selectedDay;
  @override
  DaySummary? get selectedDaySummary;
  @override
  Map<DateTime, DayHighlight>? get selectedMonthHighlights;
  @override
  @JsonKey(ignore: true)
  _$$_JournalStateCopyWith<_$_JournalState> get copyWith =>
      throw _privateConstructorUsedError;
}
