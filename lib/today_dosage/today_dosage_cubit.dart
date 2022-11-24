import 'package:apkainzynierka/domain/usecase/report_dose_taken.dart';
import 'package:apkainzynierka/domain/usecase/revert_today_dose.dart';
import 'package:apkainzynierka/today_dosage/state/today_dosage_state.dart';
import 'package:apkainzynierka/today_dosage/today_dosage_navigation_event.dart';
import 'package:bloc/bloc.dart';

class TodayDosageCubit extends Cubit<TodayDosageState> {
  final Sink<TodayDosageNavigationEvent> navigationEventSink;
  final ReportDoseTaken _reportDoseTaken;
  final RevertTodayDose _revertDoseTaken;

  TodayDosageCubit(
      this.navigationEventSink, this._reportDoseTaken, this._revertDoseTaken)
      : super(const TodayDosageState(
            taken: false, potency: 0, custom: false, scheduleUndefined: true));

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
}
