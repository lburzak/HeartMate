import 'package:apkainzynierka/domain/repository/schedule_repository.dart';
import 'package:apkainzynierka/feature/schedule_wizard/model/schedule_overlap_answer.dart';
import 'package:apkainzynierka/feature/schedule_wizard/model/schedule_type.dart';
import 'package:apkainzynierka/feature/schedule_wizard/model/schedule_wizard_state.dart';
import 'package:apkainzynierka/feature/schedule_wizard/schedule_wizard_router.dart';
import 'package:bloc/bloc.dart';

const _initialScheduleType = ScheduleType.daily;

class ScheduleWizardCubit extends Cubit<ScheduleWizardState> {
  final ScheduleRepository _scheduleRepository;
  final ScheduleWizardRouter _router;

  ScheduleWizardCubit(this._scheduleRepository, this._router)
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

    if (_scheduleRepository.scheduleWithinPeriodExists(
        state.startDate, state.endDate)) {
      _router
          .promptScheduleOverlap()
          .then(_handleScheduleOverlap)
          .then((_) => save());
      return;
    }

    _scheduleRepository.createSchedule(
        startDate: state.startDate,
        endDate: state.endDate,
        dosageCycle: state.dosages);
  }

  void _handleScheduleOverlap(ScheduleOverlapAnswer answer) {
    if (answer == ScheduleOverlapAnswer.cancel) {
      return;
    }

    final scheduleId = _scheduleRepository.findScheduleIdsWithinPeriod()[0];
    _scheduleRepository.updateScheduleEndDate(scheduleId, state.startDate);
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
