import 'package:freezed_annotation/freezed_annotation.dart';

part 'inr_measurement.freezed.dart';
part 'inr_measurement.g.dart';

@freezed
class InrMeasurement with _$InrMeasurement {
  const factory InrMeasurement(
      {required DateTime reportDate, required double inr}) = _InrMeasurement;

  factory InrMeasurement.fromJson(Map<String, dynamic> json) =>
      _$InrMeasurementFromJson(json);
}
