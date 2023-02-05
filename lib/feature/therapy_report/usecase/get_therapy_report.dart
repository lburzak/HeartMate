import 'package:apkainzynierka/domain/model/dose.dart';
import 'package:apkainzynierka/domain/repository/dose_repository.dart';
import 'package:apkainzynierka/domain/repository/inr_measurement_repository.dart';
import 'package:apkainzynierka/domain/repository/profile_repository.dart';
import 'package:apkainzynierka/domain/repository/schedule_repository.dart';
import 'package:apkainzynierka/feature/therapy_report/model/journal_entry.dart';
import 'package:apkainzynierka/feature/therapy_report/model/therapy_report.dart';
import 'package:apkainzynierka/util/collections.dart';
import 'package:apkainzynierka/util/period.dart';
import 'package:apkainzynierka/util/time_extensions.dart';

class GetTherapyReport {
  final ProfileRepository _profileRepository;
  final ScheduleRepository _scheduleRepository;
  final DoseRepository _doseRepository;
  final InrMeasurementRepository _inrMeasurementRepository;

  GetTherapyReport(this._profileRepository, this._scheduleRepository,
      this._doseRepository, this._inrMeasurementRepository);

  TherapyReport call({required DateTime start, required DateTime end}) {
    final profile = _profileRepository.getCurrent();
    final now = DateTime.now();
    final days = Period(start: start, end: end).days;
    final dosages =
        _scheduleRepository.getDosagesForPeriod(start: start, end: end);
    final doses = _doseRepository.findWithinPeriod(start: start, end: end);
    final measurements =
        _inrMeasurementRepository.findWithinPeriod(start: start, end: end);

    return TherapyReport(
        reportDate: now,
        firstName: profile.firstName,
        lastName: profile.lastName,
        age: profile.age,
        gender: profile.gender,
        height: profile.height,
        illness: profile.illness,
        weight: profile.weight,
        journalEntries:
            days.map((day) => _buildJournalEntry(day, doses, dosages)).toList(),
        inrMeasurements: Map.fromEntries(
            measurements.map((e) => MapEntry(e.reportDate, e.inr))));
  }

  JournalEntry _buildJournalEntry(
      DateTime day, List<Dose> doses, Map<DateTime, double?> dosages) {
    final dose = doses.firstWhereOrNull((e) => e.dateTaken.isSameDayAs(day));
    final profile = _profileRepository.findForDateTime(day);

    return JournalEntry(
        date: day,
        otherMedicines: profile?.otherMedicines ?? [],
        scheduledDose: dosages[day],
        takenDose: dose?.potency,
        anticoagulant: profile?.anticoagulant);
  }
}
