abstract class ScheduleRepository {
  int? getScheduleIdForDay(DateTime dateTime);

  double getDosageForDay(int scheduleId, DateTime dateTime);
}
