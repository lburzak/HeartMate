import 'package:apkainzynierka/domain/repository/dose_repository.dart';
import 'package:apkainzynierka/domain/repository/schedule_repository.dart';

class ReportDoseTaken {
  final ScheduleRepository _scheduleRepository;
  final DoseRepository _doseRepository;

  const ReportDoseTaken(this._scheduleRepository, this._doseRepository);

  void standard() {
    final now = DateTime.now();
    final scheduleId = _scheduleRepository.getScheduleIdForDay(now);

    if (scheduleId == null) {
      throw StateError("No schedule for today");
    }

    final dosage = _scheduleRepository.getDosageForDay(scheduleId, now);

    _doseRepository.insertDoseTaken(now, dosage);
  }

  void custom(double potency) {
    final now = DateTime.now();

    _doseRepository.insertDoseTaken(now, potency);
  }
}
