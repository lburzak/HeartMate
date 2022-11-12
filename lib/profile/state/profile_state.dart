import 'package:apkainzynierka/profile/model/gender.dart';
import 'package:apkainzynierka/profile/model/notifications_mode.dart';
import 'package:apkainzynierka/profile/model/range.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState(
      {int? age,
      String? ageError,
      required List<String> availableMedicines,
      Gender? gender,
      int? height,
      String? heightError,
      required Range inrRange,
      String? inrRangeError,
      String? notificationTimeError,
      required NotificationsMode notificationsMode,
      required List<String> otherMedicines,
      String? selectedMedicine,
      int? weight,
      String? weightError}) = _ProfileState;
}

extension SubmitVerification on ProfileState {
  bool get submitEnabled =>
      [
        notificationTimeError,
        inrRangeError,
        ageError,
        weightError,
        heightError,
      ].every((prop) => prop == null) &&
      [age, weight, height].every((prop) => prop != null);
}
