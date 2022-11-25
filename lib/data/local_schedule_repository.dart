import 'package:apkainzynierka/domain/repository/schedule_repository.dart';

class LocalScheduleRepository extends ScheduleRepository {
  @override
  double getDosageForDay(int scheduleId, DateTime dateTime) {
    return 1.5;
  }

  @override
  int? getScheduleIdForDay(DateTime dateTime) {
    return 1;
  }
}
