import 'package:apkainzynierka/domain/repository/schedule_repository.dart';

class CreateSchedule {
  final ScheduleRepository _scheduleRepository;

  CreateSchedule(this._scheduleRepository);

  void call(
      {required DateTime startDate,
      required DateTime endDate,
      required List<double> dosages}) {
    if (_scheduleRepository.scheduleWithinPeriodExists(startDate, endDate)) {
      throw ScheduleOverlapException();
    }

    _scheduleRepository.createSchedule(
        startDate: startDate, endDate: endDate, dosageCycle: dosages);
  }
}

class ScheduleOverlapException implements Exception {}
