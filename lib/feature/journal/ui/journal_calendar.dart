import 'package:apkainzynierka/feature/journal/model/day_highlight.dart';
import 'package:apkainzynierka/theme/brand_theme.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class JournalCalendar extends StatelessWidget {
  final DateTime? selectedDay;
  final Map<DateTime, DayHighlight>? selectedMonthHighlights;
  final void Function(DateTime day) onDaySelected;
  final void Function(DateTime day) onDayFocused;

  const JournalCalendar(
      {super.key,
      this.selectedDay,
      required this.onDaySelected,
      this.selectedMonthHighlights,
      required this.onDayFocused});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: "pl_PL",
      onDaySelected: (selectedDay, focusedDay) => onDaySelected(selectedDay),
      selectedDayPredicate: (day) => isSameDay(day, selectedDay),
      headerStyle: const HeaderStyle(formatButtonVisible: false),
      daysOfWeekHeight: 32,
      calendarStyle: const CalendarStyle(
          outsideDaysVisible: false, isTodayHighlighted: true),
      focusedDay: selectedDay ?? DateTime.now(),
      firstDay: DateTime(2020),
      lastDay: DateTime.now().add(const Duration(days: 366 * 5)),
      currentDay: DateTime.now(),
      onPageChanged: onDayFocused,
      calendarBuilders: CalendarBuilders(markerBuilder: (context, day, events) {
        final List<Widget> markers = [];
        final dayHighlights = selectedMonthHighlights?[day];
        if (dayHighlights == null) {
          return const SizedBox.shrink();
        }

        if (dayHighlights.doseMissed) {
          markers.add(const DoseMissedMarker());
        }

        switch (dayHighlights.inrStatus) {
          case InrStatus.balanced:
            markers.add(const InrMeasuredMarker(positive: true));
            break;
          case InrStatus.imbalanced:
            markers.add(const InrMeasuredMarker(positive: false));
            break;
          case InrStatus.notMeasured:
            break;
        }

        if (dayHighlights.hasNote) {
          markers.add(const HasNoteMarker());
        }

        return MarkersContainer(markers: markers);
      }),
    );
  }
}

class DayCell extends StatelessWidget {
  final DateTime day;
  final DateTime focusedDay;

  bool get isFocused =>
      day.day == focusedDay.day && day.month == focusedDay.month;

  TextStyle get todayStyle =>
      const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold);

  const DayCell({super.key, required this.day, required this.focusedDay});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox.square(
      dimension: 38,
      child: Material(
        color: isFocused
            ? Colors.blue.shade300.withOpacity(0.7)
            : Colors.transparent,
        type: MaterialType.circle,
        child: Center(
          child: Text(day.day.toString()),
        ),
      ),
    ));
  }
}

class MarkersContainer extends StatelessWidget {
  final List<Widget> markers;

  const MarkersContainer({super.key, required this.markers});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: markers);
  }
}

class HasNoteMarker extends StatelessWidget {
  const HasNoteMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.note,
      size: 16,
      color: Color(0xffeeeeee),
    );
  }
}

class DoseMissedMarker extends StatelessWidget {
  const DoseMissedMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.close,
      size: 16,
      color: BrandTheme.of(context).badColor,
    );
  }
}

class InrMeasuredMarker extends StatelessWidget {
  final bool positive;

  const InrMeasuredMarker({super.key, required this.positive});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.bloodtype,
      size: 16,
      color: positive ? Colors.blue : BrandTheme.of(context).badColor,
    );
  }
}
