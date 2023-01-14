import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/domain/model/schedule.dart';
import 'package:apkainzynierka/domain/repository/resource_error.dart';
import 'package:apkainzynierka/domain/repository/schedule_repository.dart';
import 'package:apkainzynierka/util/period.dart';
import 'package:hive/hive.dart';

class LocalScheduleRepository extends ScheduleRepository {
  final Box<Schedule> _schedules;
  final BoxDatabase _database;

  LocalScheduleRepository(BoxDatabase database)
      : _schedules = database.schedulesBox,
        _database = database;

  int getNextId() => _database.getNextId(Schedule);

  @override
  double getDosageForDay(int scheduleId, DateTime dateTime) {
    final schedule = _schedules.get(scheduleId);

    if (schedule == null) {
      throw NoSuchResourceError();
    }

    final daysFromScheduleStart =
        dateTime.difference(schedule.effectiveFrom).inDays;

    final dayPositionInScheme =
        daysFromScheduleStart % schedule.dosageScheme.length;

    return schedule.dosageScheme[dayPositionInScheme];
  }

  @override
  int? getScheduleIdForDay(DateTime dateTime) {
    final matchingSchedules = _schedules.values
        .where((i) => i.effectiveFrom.isBefore(dateTime))
        .toList();

    if (matchingSchedules.isEmpty) {
      return null;
    }

    matchingSchedules
        .sort((a, b) => a.effectiveFrom.compareTo(b.effectiveFrom));

    return matchingSchedules[0].id;
  }

  @override
  void createSchedule(
      {required DateTime startDate, required List<double> dosageCycle}) {
    final schedule = Schedule(
        id: getNextId(), effectiveFrom: startDate, dosageScheme: dosageCycle);

    _schedules.put(schedule.id, schedule);
  }

  @override
  bool existsScheduleForDay(DateTime dateTime) {
    return _schedules.values
        .where((i) => i.effectiveFrom.isBefore(dateTime))
        .isNotEmpty;
  }

  @override
  Map<DateTime, double?> getDosagesForPeriod(
      {required DateTime start, required DateTime end}) {
    final period = Period(start: start, end: end);

    return Map.fromEntries(period.days.map((day) {
      final scheduleId = getScheduleIdForDay(day);
      final dosage =
          scheduleId == null ? null : getDosageForDay(scheduleId, day);

      return MapEntry(day, dosage);
    }));
  }
}
