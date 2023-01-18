import 'package:apkainzynierka/domain/repository/dose_repository.dart';
import 'package:apkainzynierka/domain/repository/inr_measurement_repository.dart';
import 'package:apkainzynierka/domain/repository/profile_repository.dart';
import 'package:apkainzynierka/domain/repository/schedule_repository.dart';
import 'package:apkainzynierka/feature/journal/model/day_summary.dart';
import 'package:apkainzynierka/feature/journal/model/state.dart';
import 'package:apkainzynierka/feature/journal/usecase/get_highlights_for_month.dart';
import 'package:apkainzynierka/feature/journal/usecase/get_rating_for_inr_measurement.dart';
import 'package:apkainzynierka/util/time_extensions.dart';
import 'package:bloc/bloc.dart';

class JournalCubit extends Cubit<JournalState> {
  final DoseRepository _doseRepository;
  final ScheduleRepository _scheduleRepository;
  final InrMeasurementRepository _inrMeasurementRepository;
  final ProfileRepository _profileRepository;
  final GetHighlightsForMonth _getHighlightsForMonth;
  final GetRatingForInrMeasurement _getRatingForInrMeasurement;

  JournalCubit(
      this._doseRepository,
      this._scheduleRepository,
      this._inrMeasurementRepository,
      this._profileRepository,
      this._getHighlightsForMonth,
      this._getRatingForInrMeasurement)
      : super(const JournalState());

  void onDayFocused(DateTime day) {
    final selectedDay = state.selectedDay;

    if (selectedDay == null || !day.isSameMonthAs(selectedDay)) {
      emit(
          state.copyWith(selectedMonthHighlights: _getHighlightsForMonth(day)));
      onDaySelected(day);
    }
  }

  void onDaySelected(DateTime day) {
    final selectedDay = state.selectedDay;

    if (selectedDay == null || !day.isSameMonthAs(selectedDay)) {
      emit(
          state.copyWith(selectedMonthHighlights: _getHighlightsForMonth(day)));
    }

    final scheduleId = _scheduleRepository.getScheduleIdForDay(day);

    final dosage = scheduleId != null
        ? _scheduleRepository.getDosageForDay(scheduleId, day)
        : null;
    final dose = _doseRepository.findDoseForDay(day);

    final inrMeasurement = _inrMeasurementRepository.findForDay(day);

    final profile = _profileRepository.findForDateTime(day);

    final summary = DaySummary(
        dosage: dose?.potency ?? dosage,
        taken: dose != null,
        inr: inrMeasurement?.inr,
        inrRating: inrMeasurement != null
            ? _getRatingForInrMeasurement(inrMeasurement)
            : null,
        otherMedicines: profile.otherMedicines,
        anticoagulant: profile.anticoagulant);

    emit(state.copyWith(selectedDay: day, selectedDaySummary: summary));
  }
}
