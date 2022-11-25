import 'package:freezed_annotation/freezed_annotation.dart';

part 'dose.freezed.dart';
part 'dose.g.dart';

@freezed
class Dose with _$Dose {
  const factory Dose(
      {required double potency,
      required bool custom,
      required DateTime dateTaken}) = $Dose;

  factory Dose.fromJson(Map<String, Object?> json) => _$DoseFromJson(json);
}
