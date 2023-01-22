import 'dart:math';

import 'package:apkainzynierka/domain/event/schedule_updated_event.dart';
import 'package:apkainzynierka/feature/schedule_wizard/model/schedule_type.dart';
import 'package:apkainzynierka/feature/schedule_wizard/model/schedule_wizard_state.dart';
import 'package:apkainzynierka/feature/schedule_wizard/service/router.dart';
import 'package:apkainzynierka/feature/schedule_wizard/usecase/create_schedule.dart';
import 'package:apkainzynierka/feature/schedule_wizard/usecase/get_step_dosage.dart';
import 'package:apkainzynierka/util/date.dart';
import 'package:bloc/bloc.dart';
import 'package:event_bus/event_bus.dart';

const _initialScheduleType = ScheduleType.daily;

class ScheduleWizardCubit extends Cubit<ScheduleWizardState> {
  final ScheduleWizardRouter _router;
  final CreateSchedule _createSchedule;
  final GetStepDosage _getStepDosage;
  final EventBus _eventBus;

  ScheduleWizardCubit(
      this._router, this._createSchedule, this._eventBus, this._getStepDosage)
      : super(ScheduleWizardState(
            scheduleType: _initialScheduleType,
            startDate: Date.today(),
            dosageStepsIndices: _initStepIndices(_initialScheduleType),
            dosages: _initDosages(_initialScheduleType)));

  void incrementDosage(int dayIndex) {
    emit(state.copyWith(
        dosageStepsIndices: state.dosageStepsIndices
            .transformedAt(dayIndex, (item) => item + 1),
        dosages: state.dosages.transformedAt(
            dayIndex,
            (currentValue) => max(
                0, _getStepDosage(state.dosageStepsIndices[dayIndex] + 1)))));
  }

  void decrementDosage(int dayIndex) {
    emit(state.copyWith(
        dosageStepsIndices: state.dosageStepsIndices
            .transformedAt(dayIndex, (item) => item - 1),
        dosages: state.dosages.transformedAt(
            dayIndex,
            (currentValue) => max(
                0, _getStepDosage(state.dosageStepsIndices[dayIndex] - 1)))));
  }

  void setStartDate(DateTime dateTime) {
    if (dateTime.isBefore(Date.today())) {
      emit(state.copyWith(startDateError: "Date from the past"));
    }

    emit(state.copyWith(startDate: dateTime, startDateError: null));
  }

  void setScheduleType(ScheduleType type) {
    emit(state.copyWith(
        scheduleType: type,
        dosages: _initDosages(type),
        dosageStepsIndices: _initStepIndices(type)));
  }

  void save() {
    if (state.startDateError != null) {
      return;
    }

    _createSchedule(startDate: state.startDate, dosages: state.dosages);

    _eventBus.fire(ScheduleUpdatedEvent());

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

  static List<int> _initStepIndices(ScheduleType scheduleType) {
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
