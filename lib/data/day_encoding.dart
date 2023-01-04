extension DayEncoding on DateTime {
  int encodeDay() => (year - 1970) * month * day;
}
