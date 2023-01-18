import 'package:apkainzynierka/feature/journal/model/day_highlight.dart';
import 'package:apkainzynierka/feature/journal/model/day_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class JournalState with _$JournalState {
  const factory JournalState(
      {DateTime? selectedDay,
      DaySummary? selectedDaySummary,
      Map<DateTime, DayHighlight>? selectedMonthHighlights}) = _JournalState;
}
