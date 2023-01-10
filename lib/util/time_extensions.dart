extension IntTime on int {
  bool get isValidHour => this < Duration.hoursPerDay && !isNegative;

  bool get isValidMinute => this < Duration.minutesPerHour && !isNegative;
}

extension Days on DateTime {
  bool isSameDayAs(DateTime b) =>
      year == b.year && month == b.month && day == b.day;
}
