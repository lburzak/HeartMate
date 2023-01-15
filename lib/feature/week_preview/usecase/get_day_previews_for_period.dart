import 'package:apkainzynierka/domain/repository/dose_repository.dart';
import 'package:apkainzynierka/domain/repository/schedule_repository.dart';
import 'package:apkainzynierka/feature/week_preview/model/day_preview.dart';
import 'package:apkainzynierka/util/collections.dart';
import 'package:apkainzynierka/util/date.dart';
import 'package:apkainzynierka/util/period.dart';
import 'package:apkainzynierka/util/time_extensions.dart';

class GetDayPreviewsForPeriod {
  final ScheduleRepository _scheduleRepository;
  final DoseRepository _doseRepository;

  GetDayPreviewsForPeriod(this._scheduleRepository, this._doseRepository);

  List<DayPreview> call({required DateTime start, required DateTime end}) {
    final scheduledDosages =
        _scheduleRepository.getDosagesForPeriod(start: start, end: end);
    final doses = _doseRepository.findWithinPeriod(start: start, end: end);

    final today = Date.today();
    final todayIndex = Period(start: start, end: end).includesInclusively(today)
        ? today.weekday - 1
        : null;

    return List.generate(7, (index) {
      final day = start.add(Duration(days: index));
      final scheduledDosage = scheduledDosages[day];
      final dose = doses.firstWhereOrNull((e) => e.dateTaken.isSameDayAs(day));

      return DayPreview(
          isToday: index == todayIndex,
          dosage: dose != null ? dose.potency : scheduledDosage,
          taken: dose != null);
    });
  }
}
