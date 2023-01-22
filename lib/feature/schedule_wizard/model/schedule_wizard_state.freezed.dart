// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_wizard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScheduleWizardState {
  ScheduleType get scheduleType => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  String? get startDateError => throw _privateConstructorUsedError;
  List<int> get dosageStepsIndices => throw _privateConstructorUsedError;
  List<double> get dosages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScheduleWizardStateCopyWith<ScheduleWizardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleWizardStateCopyWith<$Res> {
  factory $ScheduleWizardStateCopyWith(
          ScheduleWizardState value, $Res Function(ScheduleWizardState) then) =
      _$ScheduleWizardStateCopyWithImpl<$Res, ScheduleWizardState>;
  @useResult
  $Res call(
      {ScheduleType scheduleType,
      DateTime startDate,
      String? startDateError,
      List<int> dosageStepsIndices,
      List<double> dosages});
}

/// @nodoc
class _$ScheduleWizardStateCopyWithImpl<$Res, $Val extends ScheduleWizardState>
    implements $ScheduleWizardStateCopyWith<$Res> {
  _$ScheduleWizardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduleType = null,
    Object? startDate = null,
    Object? startDateError = freezed,
    Object? dosageStepsIndices = null,
    Object? dosages = null,
  }) {
    return _then(_value.copyWith(
      scheduleType: null == scheduleType
          ? _value.scheduleType
          : scheduleType // ignore: cast_nullable_to_non_nullable
              as ScheduleType,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startDateError: freezed == startDateError
          ? _value.startDateError
          : startDateError // ignore: cast_nullable_to_non_nullable
              as String?,
      dosageStepsIndices: null == dosageStepsIndices
          ? _value.dosageStepsIndices
          : dosageStepsIndices // ignore: cast_nullable_to_non_nullable
              as List<int>,
      dosages: null == dosages
          ? _value.dosages
          : dosages // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$$ScheduleWizardStateCopyWith<$Res>
    implements $ScheduleWizardStateCopyWith<$Res> {
  factory _$$$ScheduleWizardStateCopyWith(_$$ScheduleWizardState value,
          $Res Function(_$$ScheduleWizardState) then) =
      __$$$ScheduleWizardStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ScheduleType scheduleType,
      DateTime startDate,
      String? startDateError,
      List<int> dosageStepsIndices,
      List<double> dosages});
}

/// @nodoc
class __$$$ScheduleWizardStateCopyWithImpl<$Res>
    extends _$ScheduleWizardStateCopyWithImpl<$Res, _$$ScheduleWizardState>
    implements _$$$ScheduleWizardStateCopyWith<$Res> {
  __$$$ScheduleWizardStateCopyWithImpl(_$$ScheduleWizardState _value,
      $Res Function(_$$ScheduleWizardState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduleType = null,
    Object? startDate = null,
    Object? startDateError = freezed,
    Object? dosageStepsIndices = null,
    Object? dosages = null,
  }) {
    return _then(_$$ScheduleWizardState(
      scheduleType: null == scheduleType
          ? _value.scheduleType
          : scheduleType // ignore: cast_nullable_to_non_nullable
              as ScheduleType,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startDateError: freezed == startDateError
          ? _value.startDateError
          : startDateError // ignore: cast_nullable_to_non_nullable
              as String?,
      dosageStepsIndices: null == dosageStepsIndices
          ? _value._dosageStepsIndices
          : dosageStepsIndices // ignore: cast_nullable_to_non_nullable
              as List<int>,
      dosages: null == dosages
          ? _value._dosages
          : dosages // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc

class _$$ScheduleWizardState implements $ScheduleWizardState {
  const _$$ScheduleWizardState(
      {required this.scheduleType,
      required this.startDate,
      this.startDateError,
      required final List<int> dosageStepsIndices,
      required final List<double> dosages})
      : _dosageStepsIndices = dosageStepsIndices,
        _dosages = dosages;

  @override
  final ScheduleType scheduleType;
  @override
  final DateTime startDate;
  @override
  final String? startDateError;
  final List<int> _dosageStepsIndices;
  @override
  List<int> get dosageStepsIndices {
    if (_dosageStepsIndices is EqualUnmodifiableListView)
      return _dosageStepsIndices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dosageStepsIndices);
  }

  final List<double> _dosages;
  @override
  List<double> get dosages {
    if (_dosages is EqualUnmodifiableListView) return _dosages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dosages);
  }

  @override
  String toString() {
    return 'ScheduleWizardState(scheduleType: $scheduleType, startDate: $startDate, startDateError: $startDateError, dosageStepsIndices: $dosageStepsIndices, dosages: $dosages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$ScheduleWizardState &&
            (identical(other.scheduleType, scheduleType) ||
                other.scheduleType == scheduleType) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.startDateError, startDateError) ||
                other.startDateError == startDateError) &&
            const DeepCollectionEquality()
                .equals(other._dosageStepsIndices, _dosageStepsIndices) &&
            const DeepCollectionEquality().equals(other._dosages, _dosages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      scheduleType,
      startDate,
      startDateError,
      const DeepCollectionEquality().hash(_dosageStepsIndices),
      const DeepCollectionEquality().hash(_dosages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$ScheduleWizardStateCopyWith<_$$ScheduleWizardState> get copyWith =>
      __$$$ScheduleWizardStateCopyWithImpl<_$$ScheduleWizardState>(
          this, _$identity);
}

abstract class $ScheduleWizardState implements ScheduleWizardState {
  const factory $ScheduleWizardState(
      {required final ScheduleType scheduleType,
      required final DateTime startDate,
      final String? startDateError,
      required final List<int> dosageStepsIndices,
      required final List<double> dosages}) = _$$ScheduleWizardState;

  @override
  ScheduleType get scheduleType;
  @override
  DateTime get startDate;
  @override
  String? get startDateError;
  @override
  List<int> get dosageStepsIndices;
  @override
  List<double> get dosages;
  @override
  @JsonKey(ignore: true)
  _$$$ScheduleWizardStateCopyWith<_$$ScheduleWizardState> get copyWith =>
      throw _privateConstructorUsedError;
}
