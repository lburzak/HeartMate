import 'package:freezed_annotation/freezed_annotation.dart';

part 'day_highlight.freezed.dart';

@freezed
class DayHighlight with _$DayHighlight {
  const factory DayHighlight(
      {required bool doseMissed, required InrStatus inrStatus}) = _DayHighlight;
}

enum InrStatus { notMeasured, balanced, imbalanced }
