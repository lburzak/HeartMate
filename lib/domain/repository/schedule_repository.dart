abstract class ScheduleRepository {
  int? getScheduleIdForDay(DateTime dateTime);

  double getDosageForDay(int scheduleId, DateTime dateTime);

  bool scheduleWithinPeriodExists(DateTime periodStart, DateTime periodEnd);

  List<int> findScheduleIdsWithinPeriod(
      {required DateTime periodStart, required DateTime periodEnd});

  void updateScheduleEndDate(int scheduleId, DateTime endDate);

  void createSchedule(
      {required DateTime startDate,
      required DateTime endDate,
      required List<double> dosageCycle});
}
