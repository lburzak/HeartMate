import 'package:freezed_annotation/freezed_annotation.dart';

part 'period.freezed.dart';

@freezed
class Period with _$Period {
  const factory Period({required DateTime start, required DateTime end}) =
      _Period;
}

extension PeriodUtil on Period {
  bool overlaps(Period other) {
    return (start.isBefore(other.end)) && (other.start.isBefore(other.end));
  }

  List<DateTime> get days => List.generate(end.difference(start).inDays + 1,
      (index) => start.add(Duration(days: index)));
}
