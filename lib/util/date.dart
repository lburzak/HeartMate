class Date {
  static DateTime today() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }
}

class Week {
  final DateTime relativeDay;

  Week(DateTime dateTime) : relativeDay = dateTime.trimTime();

  DateTime get monday => getDay(DateTime.monday);

  DateTime get friday => getDay(DateTime.friday);

  DateTime getDay(int number) {
    return relativeDay.subtract(
        Duration(days: relativeDay.weekday - number));
  }
}

extension DateUtil on DateTime {
  DateTime trimTime() {
    return DateTime(year, month, day);
  }

  Week get week => Week(this);
}

void main() {
  print(DateTime.now().week.monday);
}
