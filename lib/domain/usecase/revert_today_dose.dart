import 'package:apkainzynierka/domain/event/today_dose_updated_event.dart';
import 'package:apkainzynierka/domain/repository/dose_repository.dart';
import 'package:event_bus/event_bus.dart';

class RevertTodayDose {
  final DoseRepository _doseRepository;
  final EventBus _eventBus;

  RevertTodayDose(this._doseRepository, this._eventBus);

  call() {
    final now = DateTime.now();
    _doseRepository.removeDoseFromDay(now);
    _eventBus.fire(TodayDoseUpdatedEvent());
  }
}
