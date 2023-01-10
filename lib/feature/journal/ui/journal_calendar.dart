import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class JournalCalendar extends StatelessWidget {
  final DateTime? selectedDay;
  final void Function(DateTime day) onDaySelected;

  const JournalCalendar(
      {super.key, this.selectedDay, required this.onDaySelected});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      onDaySelected: (selectedDay, focusedDay) => onDaySelected(selectedDay),
      selectedDayPredicate: (day) => isSameDay(day, selectedDay),
      headerStyle: const HeaderStyle(formatButtonVisible: false),
      calendarStyle: const CalendarStyle(
          outsideDaysVisible: false, isTodayHighlighted: true),
      focusedDay: DateTime.now().add(const Duration(days: 2)),
      firstDay: DateTime(2020),
      lastDay: DateTime(2025),
      currentDay: DateTime.now(),
      calendarBuilders: CalendarBuilders(
          markerBuilder: (context, day, events) =>
              const MarkersContainer(markers: [Marker.doseMissed()])),
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

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 16,
      color: color,
    );
  }
}
