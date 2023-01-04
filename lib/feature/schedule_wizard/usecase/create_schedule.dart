import 'package:apkainzynierka/domain/repository/schedule_repository.dart';

class CreateSchedule {
  final ScheduleRepository _scheduleRepository;

  CreateSchedule(this._scheduleRepository);

  void call({required DateTime startDate, required List<double> dosages}) {
    _scheduleRepository.createSchedule(
        startDate: startDate, dosageCycle: dosages);
  }
}

class ScheduleOverlapException implements Exception {}
