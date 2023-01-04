import 'package:apkainzynierka/feature/schedule_wizard/model/schedule_type.dart';
import 'package:apkainzynierka/feature/schedule_wizard/model/schedule_wizard_state.dart';
import 'package:apkainzynierka/feature/schedule_wizard/service/router.dart';
import 'package:apkainzynierka/feature/schedule_wizard/usecase/create_schedule.dart';
import 'package:bloc/bloc.dart';

const _initialScheduleType = ScheduleType.daily;

class ScheduleWizardCubit extends Cubit<ScheduleWizardState> {
  final ScheduleWizardRouter _router;
  final CreateSchedule _createSchedule;

  ScheduleWizardCubit(this._router, this._createSchedule)
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

  void setScheduleType(ScheduleType type) {}

  void save() {
    if (state.startDateError != null) {
      return;
    }

    _createSchedule(startDate: state.startDate, dosages: state.dosages);

    _router.finish();
  }

  static List<double> _initDosages(ScheduleType scheduleType) {
    switch (scheduleType) {
      case ScheduleType.daily:
        return List.generate(1, (index) => 0);
      case ScheduleType.weekly:
        return List.generate(7, (index) => 0);
    }
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
