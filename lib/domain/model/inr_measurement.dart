import 'package:freezed_annotation/freezed_annotation.dart';

part 'inr_measurement.freezed.dart';

@freezed
class InrMeasurement with _$InrMeasurement {
  const factory InrMeasurement(
      {required DateTime reportDate, required double inr}) = _InrMeasurement;
}
