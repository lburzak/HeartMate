abstract class ScheduleRepository {
  int? getScheduleIdForDay(DateTime dateTime);

  bool existsScheduleForDay(DateTime dateTime);

  double getDosageForDay(int scheduleId, DateTime dateTime);

  void createSchedule(
      {required DateTime startDate, required List<double> dosageCycle});
}
