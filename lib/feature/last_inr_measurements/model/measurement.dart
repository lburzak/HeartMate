import 'package:freezed_annotation/freezed_annotation.dart';

part 'measurement.freezed.dart';

@freezed
class Measurement with _$Measurement {
  const factory Measurement(
      {required double value,
      required DateTime reportedAt,
      required bool isOutsideTherapeuticRange,
      required bool isSelected}) = _Measurement;
}
