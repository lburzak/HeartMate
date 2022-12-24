import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/domain/model/schedule.dart';
import 'package:apkainzynierka/domain/repository/resource_error.dart';
import 'package:apkainzynierka/domain/repository/schedule_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
        .where((i) => dateTime.isBetween(i.effectiveFrom, i.effectiveTo))
        .toList();

    if (matchingSchedules.isEmpty) {
      return null;
    }

    return matchingSchedules[0].id;
  }

  @override
  void createSchedule(
      {required DateTime startDate,
      required DateTime endDate,
      required List<double> dosageCycle}) {
    final schedule = Schedule(
        id: getNextId(),
        effectiveFrom: startDate,
        effectiveTo: endDate,
        dosageScheme: dosageCycle);

    _schedules.put(schedule.id, schedule);
  }

  @override
  List<int> findScheduleIdsWithinPeriod(
      {required DateTime periodStart, required DateTime periodEnd}) {
    final schedules = _schedules.values.where(
        (element) => element.isEffectiveWithinPeriod(periodStart, periodEnd));

    final ids = schedules.map((e) => e.id);

    return ids.toList();
  }

  @override
  bool scheduleWithinPeriodExists(DateTime periodStart, DateTime periodEnd) {
    final schedules = _schedules.values.where(
        (element) => element.isEffectiveWithinPeriod(periodStart, periodEnd));

    return schedules.isNotEmpty;
  }

  @override
  void updateScheduleEndDate(int scheduleId, DateTime endDate) {
    final schedule = _schedules.get(scheduleId);

    if (schedule == null) {
      throw NoSuchResourceError();
    }

    final updatedSchedule = schedule.copyWith(effectiveTo: endDate);

    _schedules.put(scheduleId, updatedSchedule);
  }
}

extension BetweenDateTime on DateTime {
  bool isBetween(DateTime start, DateTime end) {
    return isAfter(start) && isBefore(end);
  }
}

extension SchedulePeriod on Schedule {
  bool isEffectiveWithinPeriod(DateTime periodStart, DateTime periodEnd) {
    return effectiveFrom.isAfter(periodStart) &&
        effectiveTo.isBefore(periodEnd);
  }
}
