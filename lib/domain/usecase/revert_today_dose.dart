import 'package:apkainzynierka/domain/repository/dose_repository.dart';

class RevertTodayDose {
  final DoseRepository _doseRepository;

  RevertTodayDose(this._doseRepository);

  call() {
    final now = DateTime.now();
    _doseRepository.removeDoseFromDay(now);
  }
}
