import 'dart:async';

import 'package:apkainzynierka/domain/event/schedule_updated_event.dart';
import 'package:apkainzynierka/domain/event/today_dose_updated_event.dart';
import 'package:apkainzynierka/domain/repository/dose_repository.dart';
import 'package:apkainzynierka/domain/repository/schedule_repository.dart';
import 'package:apkainzynierka/domain/usecase/get_today_dosage.dart';
import 'package:apkainzynierka/domain/usecase/report_dose_taken.dart';
import 'package:apkainzynierka/domain/usecase/revert_today_dose.dart';
import 'package:apkainzynierka/feature/today_dosage/model/state.dart';
import 'package:apkainzynierka/feature/today_dosage/service/router.dart';
import 'package:bloc/bloc.dart';
import 'package:event_bus/event_bus.dart';

class TodayDosageCubit extends Cubit<TodayDosageState> {
  final ReportDoseTaken _reportDoseTaken;
  final RevertTodayDose _revertDoseTaken;
  final GetTodayDosage _getTodayDosage;
  final DoseRepository _doseRepository;
  final ScheduleRepository _scheduleRepository;
  final TodayDosageRouter _router;
  final EventBus _eventBus;

  StreamSubscription? _subscription;

  TodayDosageCubit(
      this._reportDoseTaken,
      this._revertDoseTaken,
      this._getTodayDosage,
      this._doseRepository,
      this._scheduleRepository,
      this._router,
      this._eventBus)
      : super(const TodayDosageState(
            taken: false, potency: 0, custom: false, scheduleUndefined: true)) {
    _fetchData();

    _subscription = _eventBus.on<ScheduleUpdatedEvent>().listen((event) {
      _fetchData();
    });

    _subscription = _eventBus.on<TodayDoseUpdatedEvent>().listen((event) {
      _fetchData();
    });
  }

  void toggleTaken() {
    if (state.scheduleUndefined) {
      _router.openScheduleWizard();
      return;
    }

    if (!state.taken) {
      _reportDoseTaken.standard();
      emit(state.copyWith(taken: true));
    } else {
      _revertDoseTaken();
      emit(state.copyWith(taken: false));
    }
  }

  void showCustomDosageScreen() {
    if (state.taken) {
      return;
    }

    _router.openCustomDosageScreen();
  }

  void _fetchData() {
    final now = DateTime.now();

    final scheduleExists = !_scheduleRepository.existsScheduleForDay(now);
    final takenDose = _doseRepository.findDoseForDay(now);
    final scheduledDosage = _getTodayDosage();

    emit(state.copyWith(
      scheduleUndefined: scheduleExists,
      taken: takenDose != null,
      custom: takenDose?.custom ?? false,
      potency: takenDose?.potency ?? scheduledDosage ?? 0,
    ));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
