extension IntTime on int {
  bool get isValidHour => this < Duration.hoursPerDay && !isNegative;

  bool get isValidMinute => this < Duration.minutesPerHour && !isNegative;
}
