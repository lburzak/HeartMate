import 'package:apkainzynierka/util/time_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      "firstDayOfMonth returns proper date when date is in the middle of month",
      () {
    final day = DateTime(2022, 04, 15);
    final result = day.firstDayOfMonth;
    expect(result, equals(DateTime(2022, 04, 01)));
  });

  test("firstDayOfMonth returns proper date when date is on start of year", () {
    final day = DateTime(2022, 01, 01);
    final result = day.firstDayOfMonth;
    expect(result, equals(DateTime(2022, 01, 01)));
  });

  test("lastDayOfMonth returns proper date when date is on start of year", () {
    final day = DateTime(2022, 01, 31);
    final result = day.lastDayOfMonth;
    expect(result, equals(DateTime(2022, 01, 31)));
  });
}
