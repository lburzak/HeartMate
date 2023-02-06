import 'package:apkainzynierka/feature/journal/model/day_highlight.dart';
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
        final List<Marker> markers = [];
        final dayHighlights = selectedMonthHighlights?[day];
        if (dayHighlights == null) {
          return const SizedBox.shrink();
        }

        if (dayHighlights.doseMissed) {
          markers.add(const Marker.doseMissed());
        }

        switch (dayHighlights.inrStatus) {
          case InrStatus.balanced:
            markers.add(const Marker.inrMeasured(positive: true));
            break;
          case InrStatus.imbalanced:
            markers.add(const Marker.inrMeasured(positive: false));
            break;
          case InrStatus.notMeasured:
            break;
        }

        if (dayHighlights.hasNote) {
          markers.add(const Marker.hasNote());
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
  final List<Marker> markers;

  const MarkersContainer({super.key, required this.markers});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: markers);
  }
}

class Marker extends StatelessWidget {
  final IconData icon;
  final Color color;

  const Marker.doseMissed({super.key})
      : icon = Icons.close,
        color = Colors.red;

  const Marker.inrMeasured({super.key, required bool positive})
      : icon = Icons.circle,
        color = positive ? Colors.blue : Colors.red;

  const Marker.hasNote({super.key})
      : icon = Icons.note,
        color = const Color(0xffeeeeee);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 16,
      color: color,
    );
  }
}
