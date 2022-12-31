import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_of_day.freezed.dart';
part 'time_of_day.g.dart';

@freezed
class TimeOfDay with _$TimeOfDay {
  const factory TimeOfDay({required int minute, required int hour}) =
      _TimeOfDay;

  factory TimeOfDay.fromJson(Map<String, dynamic> json) =>
      _$TimeOfDayFromJson(json);
}
