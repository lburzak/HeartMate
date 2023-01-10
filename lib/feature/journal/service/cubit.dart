import 'package:apkainzynierka/domain/model/inr_measurement.dart';
import 'package:apkainzynierka/domain/repository/dose_repository.dart';
import 'package:apkainzynierka/domain/repository/inr_measurement_repository.dart';
import 'package:apkainzynierka/domain/repository/profile_repository.dart';
import 'package:apkainzynierka/domain/repository/schedule_repository.dart';
import 'package:apkainzynierka/feature/journal/model/day_summary.dart';
import 'package:apkainzynierka/feature/journal/model/state.dart';
import 'package:bloc/bloc.dart';

class JournalCubit extends Cubit<JournalState> {
  final DoseRepository _doseRepository;
  final ScheduleRepository _scheduleRepository;
  final InrMeasurementRepository _inrMeasurementRepository;
  final ProfileRepository _profileRepository;

  JournalCubit(this._doseRepository, this._scheduleRepository,
      this._inrMeasurementRepository, this._profileRepository)
      : super(const JournalState());

  void onDaySelected(DateTime day) {
    final scheduleId = _scheduleRepository.getScheduleIdForDay(day);

    final dosage = scheduleId != null
        ? _scheduleRepository.getDosageForDay(scheduleId, day)
        : null;
    final dose = _doseRepository.findDoseForDay(day);

    final inrMeasurement = _inrMeasurementRepository.findForDay(day);

    final summary = DaySummary(
        dosage: dose?.potency ?? dosage,
        taken: dose != null,
        inr: inrMeasurement?.inr,
        inrRating: inrMeasurement != null ? getRating(inrMeasurement) : null);

    emit(state.copyWith(selectedDay: day, selectedDaySummary: summary));
  }

  InrRating getRating(InrMeasurement inrMeasurement) {
    final profile =
        _profileRepository.findForDateTime(inrMeasurement.reportDate);
    if (inrMeasurement.inr < profile.inrRange.from) {
      return InrRating.tooLow;
    }

    if (inrMeasurement.inr > profile.inrRange.to) {
      return InrRating.tooHigh;
    }

    return InrRating.balanced;
  }
}
