import 'package:apkainzynierka/feature/journal/model/state.dart';
import 'package:apkainzynierka/feature/journal/usecase/get_highlights_for_month.dart';
import 'package:apkainzynierka/feature/journal/usecase/get_summary_for_day.dart';
import 'package:apkainzynierka/util/time_extensions.dart';
import 'package:bloc/bloc.dart';

class JournalCubit extends Cubit<JournalState> {
  final GetHighlightsForMonth _getHighlightsForMonth;
  final GetSummaryForDay _getSummaryForDay;

  JournalCubit(this._getHighlightsForMonth, this._getSummaryForDay)
      : super(const JournalState()) {
    onDayFocused(DateTime.now());
  }

  void onDayFocused(DateTime day) {
    final selectedDay = state.selectedDay;

    if (selectedDay == null || !day.isSameMonthAs(selectedDay)) {
      emit(
          state.copyWith(selectedMonthHighlights: _getHighlightsForMonth(day)));
      onDaySelected(day);
    }
  }

  void onDaySelected(DateTime day) {
    emit(state.copyWith(
        selectedDay: day, selectedDaySummary: _getSummaryForDay(day)));
  }
}
