import 'package:apkainzynierka/domain/repository/dose_repository.dart';
import 'package:apkainzynierka/domain/repository/schedule_repository.dart';
import 'package:apkainzynierka/domain/usecase/get_today_dosage.dart';
import 'package:apkainzynierka/domain/usecase/report_dose_taken.dart';
import 'package:apkainzynierka/domain/usecase/revert_today_dose.dart';
import 'package:apkainzynierka/today_dosage/state/today_dosage_state.dart';
import 'package:apkainzynierka/today_dosage/today_dosage_navigation_event.dart';
import 'package:bloc/bloc.dart';

class TodayDosageCubit extends Cubit<TodayDosageState> {
  final Sink<TodayDosageNavigationEvent> navigationEventSink;
  final ReportDoseTaken _reportDoseTaken;
  final RevertTodayDose _revertDoseTaken;
  final GetTodayDosage _getTodayDosage;
  final DoseRepository _doseRepository;
  final ScheduleRepository _scheduleRepository;

  TodayDosageCubit(
      this.navigationEventSink,
      this._reportDoseTaken,
      this._revertDoseTaken,
      this._getTodayDosage,
      this._doseRepository,
      this._scheduleRepository)
      : super(const TodayDosageState(
            taken: false, potency: 0, custom: false, scheduleUndefined: true)) {
    _fetchData();
  }

  void toggleTaken() {
    if (state.scheduleUndefined) {
      navigationEventSink.add(OpenScheduleWizard());
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
    navigationEventSink.add(OpenCustomDosageScreen());
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
}
