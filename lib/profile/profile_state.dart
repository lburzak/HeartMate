import 'package:freezed_annotation/freezed_annotation.dart';

import 'gender.dart';
import 'medicine.dart';
import 'notifications_mode.dart';
import 'range.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState(
      {int? age,
      String? ageError,
      required List<Medicine> availableMedicines,
      Gender? gender,
      int? height,
      String? heightError,
      required Range inrRange,
      String? inrRangeError,
      String? notificationTimeError,
      required NotificationsMode notificationsMode,
      required List<String> otherMedicines,
      Medicine? selectedMedicine,
      int? weight,
      String? weightError}) = _ProfileState;
}

extension SubmitVerification on ProfileState {
  bool get submitEnabled => [
        notificationTimeError,
        inrRangeError,
        ageError,
        weightError,
        heightError
      ].every((prop) => prop == null);
}
