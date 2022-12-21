import 'package:apkainzynierka/feature/schedule_wizard/model/schedule_overlap_answer.dart';
import 'package:apkainzynierka/feature/schedule_wizard/model/schedule_type.dart';
import 'package:apkainzynierka/feature/schedule_wizard/model/schedule_wizard_state.dart';
import 'package:apkainzynierka/feature/schedule_wizard/service/router.dart';
import 'package:apkainzynierka/feature/schedule_wizard/usecase/create_schedule.dart';
import 'package:apkainzynierka/feature/schedule_wizard/usecase/push_schedules_outside_period.dart';
import 'package:bloc/bloc.dart';

const _initialScheduleType = ScheduleType.daily;

class ScheduleWizardCubit extends Cubit<ScheduleWizardState> {
  final ScheduleWizardRouter _router;
  final CreateSchedule _createSchedule;
  final PushSchedulesOutsidePeriod _pushSchedulesOutsidePeriod;

  ScheduleWizardCubit(
      this._router, this._createSchedule, this._pushSchedulesOutsidePeriod)
      : super(ScheduleWizardState(
            scheduleType: _initialScheduleType,
            startDate: Date.today(),
            endDate: Date.today(),
            dosages: _initDosages(_initialScheduleType)));

  double get _dosageStep => 0.25;

  void incrementDosage(int dayIndex) {
    emit(state.copyWith(
        dosages: state.dosages.transformedAt(
            dayIndex, (currentValue) => currentValue + _dosageStep)));
  }

  void decrementDosage(int dayIndex) {
    emit(state.copyWith(
        dosages: state.dosages.transformedAt(
            dayIndex, (currentValue) => currentValue - _dosageStep)));
  }

  void setStartDate(DateTime dateTime) {
    if (dateTime.isBefore(Date.today())) {
      emit(state.copyWith(startDateError: "Date from the past"));
    }

    emit(state.copyWith(startDate: dateTime, startDateError: null));
  }

  void setEndDate(DateTime dateTime) {
    if (dateTime.isBefore(Date.today())) {
      emit(state.copyWith(endDateError: "Date from the past"));
    }

    emit(state.copyWith(endDate: dateTime, endDateError: null));
  }

  void save() {
    if (state.startDateError != null) {
      return;
    }

    if (state.endDateError != null) {
      return;
    }

    try {
      _createSchedule(
          startDate: state.startDate,
          endDate: state.endDate,
          dosages: state.dosages);
    } on ScheduleOverlapException {
      _router
          .promptScheduleOverlap()
          .then(_handleScheduleOverlap)
          .then((_) => save());
    }
  }

  void _handleScheduleOverlap(ScheduleOverlapAnswer answer) {
    if (answer == ScheduleOverlapAnswer.cancel) {
      return;
    }

    _pushSchedulesOutsidePeriod(
        periodStart: state.startDate, periodEnd: state.endDate);
  }

  static List<double> _initDosages(ScheduleType scheduleType) {
    return List.empty();
  }
}

extension ListTransformations<T> on List<T> {
  List<T> transformedAt(int index, T Function(T item) transform) {
    final newList = List<T>.from(this);
    newList[index] = transform(elementAt(index));
    return newList;
  }
}

class Date {
  static DateTime today() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }
}
