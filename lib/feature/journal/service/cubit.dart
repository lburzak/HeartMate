import 'package:apkainzynierka/domain/repository/dose_repository.dart';
import 'package:apkainzynierka/domain/repository/schedule_repository.dart';
import 'package:apkainzynierka/feature/journal/model/day_summary.dart';
import 'package:apkainzynierka/feature/journal/model/state.dart';
import 'package:bloc/bloc.dart';

class JournalCubit extends Cubit<JournalState> {
  final DoseRepository _doseRepository;
  final ScheduleRepository _scheduleRepository;

  JournalCubit(this._doseRepository, this._scheduleRepository)
      : super(const JournalState());

  void onDaySelected(DateTime day) {
    final scheduleId = _scheduleRepository.getScheduleIdForDay(day);

    final dosage = scheduleId != null
        ? _scheduleRepository.getDosageForDay(scheduleId, day)
        : null;
    final dose = _doseRepository.findDoseForDay(day);

    final summary =
        DaySummary(dosage: dose?.potency ?? dosage, taken: dose != null);

    emit(state.copyWith(selectedDay: day, selectedDaySummary: summary));
  }
}
