import 'package:apkainzynierka/domain/repository/schedule_repository.dart';

class GetTodayDosage {
  final ScheduleRepository _scheduleRepository;

  GetTodayDosage(this._scheduleRepository);

  double? call() {
    final now = DateTime.now();
    final scheduleId = _scheduleRepository.getScheduleIdForDay(now);

    if (scheduleId == null) {
      return null;
    }

    return _scheduleRepository.getDosageForDay(scheduleId, now);
  }
}
