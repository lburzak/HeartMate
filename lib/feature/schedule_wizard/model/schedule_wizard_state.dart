import 'package:apkainzynierka/feature/schedule_wizard/model/schedule_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_wizard_state.freezed.dart';

@freezed
class ScheduleWizardState with _$ScheduleWizardState {
  const factory ScheduleWizardState(
      {required ScheduleType scheduleType,
      required DateTime startDate,
      required DateTime endDate,
      String? startDateError,
      String? endDateError,
      required List<double> dosages}) = $ScheduleWizardState;
}
