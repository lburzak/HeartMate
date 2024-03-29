import 'package:apkainzynierka/domain/repository/dose_repository.dart';
import 'package:apkainzynierka/domain/repository/inr_measurement_repository.dart';
import 'package:apkainzynierka/domain/repository/note_repository.dart';
import 'package:apkainzynierka/domain/repository/profile_repository.dart';
import 'package:apkainzynierka/domain/repository/schedule_repository.dart';
import 'package:apkainzynierka/feature/journal/model/day_summary.dart';
import 'package:apkainzynierka/feature/journal/usecase/get_rating_for_inr_measurement.dart';
import 'package:apkainzynierka/util/time_extensions.dart';

class GetSummaryForDay {
  final DoseRepository _doseRepository;
  final ScheduleRepository _scheduleRepository;
  final InrMeasurementRepository _inrMeasurementRepository;
  final ProfileRepository _profileRepository;
  final GetRatingForInrMeasurement _getRatingForInrMeasurement;
  final NoteRepository _noteRepository;

  GetSummaryForDay(this._doseRepository,
      this._scheduleRepository,
      this._inrMeasurementRepository,
      this._profileRepository,
      this._getRatingForInrMeasurement,
      this._noteRepository);

  DaySummary call(DateTime day) {
    final scheduleId = _scheduleRepository.getScheduleIdForDay(day);

    final dosage = scheduleId != null
        ? _scheduleRepository.getDosageForDay(scheduleId, day)
        : null;
    final dose = _doseRepository.findDoseForDay(day);

    final inrMeasurement = _inrMeasurementRepository.findForDay(day);

    final profile = _profileRepository.findForDateTime(day.dayEnd);

    final note = _noteRepository.getNoteForDay(day);

    return DaySummary(
        dosage: dose?.potency ?? dosage,
        taken: dose != null,
        inr: inrMeasurement?.inr,
        inrRating: inrMeasurement != null
            ? _getRatingForInrMeasurement(inrMeasurement)
            : null,
        otherMedicines: profile?.otherMedicines,
        anticoagulant: profile?.anticoagulant,
        note: note);
  }
}
