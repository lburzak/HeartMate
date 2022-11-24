import 'package:freezed_annotation/freezed_annotation.dart';

part 'dose.freezed.dart';

@freezed
class Dose with _$Dose {
  const factory Dose({required double potency, required bool custom}) = $Dose;
}
