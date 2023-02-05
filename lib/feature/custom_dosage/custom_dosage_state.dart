import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_dosage_state.freezed.dart';

@freezed
class CustomDosageState with _$CustomDosageState {
  const factory CustomDosageState({required double dosage, required int step}) =
      _CustomDosageState;
}
