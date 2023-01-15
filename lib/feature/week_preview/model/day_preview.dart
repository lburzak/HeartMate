import 'package:freezed_annotation/freezed_annotation.dart';

part 'day_preview.freezed.dart';

@freezed
class DayPreview with _$DayPreview {
  const factory DayPreview(
      {required double? dosage,
      bool? taken,
      required bool isToday}) = _DayPreview;
}
