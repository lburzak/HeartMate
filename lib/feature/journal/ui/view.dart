import 'package:apkainzynierka/feature/journal/model/state.dart';
import 'package:apkainzynierka/feature/journal/service/cubit.dart';
import 'package:apkainzynierka/feature/journal/ui/day_summary_view.dart';
import 'package:apkainzynierka/feature/journal/ui/journal_calendar.dart';
import 'package:flutter/material.dart';

class JournalView extends StatelessWidget {
  final JournalState state;
  final JournalCubit cubit;

  const JournalView({super.key, required this.state, required this.cubit});

  @override
  Widget build(BuildContext context) {
    final selectedDaySummary = state.selectedDaySummary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        JournalCalendar(
          onDaySelected: cubit.onDaySelected,
          selectedDay: state.selectedDay,
        ),
        selectedDaySummary != null
            ? DaySummaryView(model: selectedDaySummary)
            : const SizedBox.shrink()
      ],
    );
  }
}
