import 'package:freezed_annotation/freezed_annotation.dart';

part 'inr_range.freezed.dart';
part 'inr_range.g.dart';

@freezed
class InrRange with _$InrRange {
  const factory InrRange({required double from, required double to}) =
      _InrRange;

  factory InrRange.fromJson(Map<String, dynamic> json) =>
      _$InrRangeFromJson(json);
}
