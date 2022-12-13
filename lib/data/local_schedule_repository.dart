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

  @override
  void createSchedule(
      {required DateTime startDate,
      required DateTime endDate,
      required List<double> dosageCycle}) {
    // TODO: implement createSchedule
  }

  @override
  List<int> findScheduleIdsWithinPeriod() {
    // TODO: implement findScheduleIdsWithinPeriod
    return [0];
  }

  @override
  bool scheduleWithinPeriodExists(DateTime periodStart, DateTime periodEnd) {
    // TODO: implement scheduleWithinPeriodExists
    return true;
  }

  @override
  void updateScheduleEndDate(int scheduleId, DateTime startDate) {
    // TODO: implement updateScheduleEndDate
  }
}
