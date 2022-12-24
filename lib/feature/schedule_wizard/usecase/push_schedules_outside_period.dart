import 'package:apkainzynierka/domain/repository/schedule_repository.dart';

class PushSchedulesOutsidePeriod {
  final ScheduleRepository _scheduleRepository;

  PushSchedulesOutsidePeriod(this._scheduleRepository);

  void call({required DateTime periodStart, required DateTime periodEnd}) {
    final scheduleIds = _scheduleRepository.findScheduleIdsWithinPeriod(
        periodStart: periodStart, periodEnd: periodEnd);

    for (final id in scheduleIds) {
      _scheduleRepository.updateScheduleEndDate(id, periodStart);
    }
  }
}
