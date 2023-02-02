extension IntTime on int {
  bool get isValidHour => this < Duration.hoursPerDay && !isNegative;

  bool get isValidMinute => this < Duration.minutesPerHour && !isNegative;
}

extension Days on DateTime {
  bool isSameDayAs(DateTime b) =>
      year == b.year && month == b.month && day == b.day;

  bool isSameMonthAs(DateTime b) => year == b.year && month == b.month;

  DateTime get firstDayOfMonth => DateTime(year, month, 1);

  DateTime get lastDayOfMonth => DateTime(year, month + 1, 0);

  List<DateTime> get daysOfMonth {
    return List.generate(
        lastDayOfMonth.day, (index) => DateTime(year, month, index + 1));
  }
}

extension Day on DateTime {
  DateTime get dayEnd => DateTime(year, month, day + 1, 0, 0, 0, 0, -1);
  DateTime get dayStart => DateTime(year, month, day, 0, 0, 0, 0, 0);
}

bool isSameDay(DateTime? a, DateTime? b) {
  if (a == null || b == null) {
    return false;
  }

  return a.year == b.year && a.month == b.month && a.day == b.day;
}
