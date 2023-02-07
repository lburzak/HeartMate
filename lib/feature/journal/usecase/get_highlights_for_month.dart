import 'dart:collection';

import 'package:apkainzynierka/data/day_encoding.dart';
import 'package:apkainzynierka/domain/model/dose.dart';
import 'package:apkainzynierka/domain/model/inr_measurement.dart';
import 'package:apkainzynierka/domain/repository/dose_repository.dart';
import 'package:apkainzynierka/domain/repository/inr_measurement_repository.dart';
import 'package:apkainzynierka/domain/repository/note_repository.dart';
import 'package:apkainzynierka/domain/repository/schedule_repository.dart';
import 'package:apkainzynierka/feature/journal/model/day_highlight.dart';
import 'package:apkainzynierka/feature/journal/model/day_summary.dart';
import 'package:apkainzynierka/feature/journal/usecase/get_rating_for_inr_measurement.dart';
import 'package:apkainzynierka/util/collections.dart';
import 'package:apkainzynierka/util/time_extensions.dart';

class GetHighlightsForMonth {
  final DoseRepository _doseRepository;
  final InrMeasurementRepository _inrMeasurementRepository;
  final ScheduleRepository _scheduleRepository;
  final GetRatingForInrMeasurement _getRatingForInrMeasurement;
  final NoteRepository _noteRepository;

  late List<Dose> _doses;
  late List<InrMeasurement> _inrMeasurements;

  GetHighlightsForMonth(
      this._doseRepository,
      this._inrMeasurementRepository,
      this._getRatingForInrMeasurement,
      this._scheduleRepository,
      this._noteRepository);

  Map<DateTime, DayHighlight> call(DateTime month) {
    _doses = _doseRepository.findWithinPeriod(
        start: month.firstDayOfMonth, end: month.lastDayOfMonth);

    _inrMeasurements = _inrMeasurementRepository.findWithinPeriod(
        start: month.firstDayOfMonth, end: month.lastDayOfMonth);

    final map = LinkedHashMap<DateTime, DayHighlight>(
      equals: isSameDay,
      hashCode: (i) => i.encodeDay(),
    );

    final now = DateTime.now();

    for (final day
        in month.daysOfMonth.takeWhile((value) => value.isBefore(now))) {
      map[day] = DayHighlight(
          doseMissed: _determineIfDoseWasMissedForDay(day),
          inrStatus: _determineInrStatusForDay(day),
          hasNote: _noteRepository.existsNoteForDay(day));
    }

    return map;
  }

  bool _determineIfDoseWasMissedForDay(DateTime day) {
    final scheduleExists = _scheduleRepository.existsScheduleForDay(day);

    if (!scheduleExists) {
      return false;
    }

    return _doses.firstWhereOrNull((item) => item.dateTaken.isSameDayAs(day)) ==
        null;
  }

  InrStatus _determineInrStatusForDay(DateTime day) {
    final inrMeasurement = _inrMeasurements
        .firstWhereOrNull((item) => item.reportDate.isSameDayAs(day));

    if (inrMeasurement == null) {
      return InrStatus.notMeasured;
    }

    final rating = _getRatingForInrMeasurement(inrMeasurement);

    if (rating == InrRating.balanced) {
      return InrStatus.balanced;
    }

    return InrStatus.imbalanced;
  }
}
