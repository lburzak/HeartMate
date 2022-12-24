import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule.freezed.dart';

@freezed
class Schedule with _$Schedule {
  const factory Schedule(
      {required int id,
      required DateTime effectiveFrom,
      required DateTime effectiveTo,
      required List<double> dosageScheme}) = _Schedule;
}
