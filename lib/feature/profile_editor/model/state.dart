import 'package:apkainzynierka/domain/model/anticoagulant.dart';
import 'package:apkainzynierka/domain/model/gender.dart';
import 'package:apkainzynierka/domain/model/illness.dart';
import 'package:apkainzynierka/domain/model/inr_range.dart';
import 'package:apkainzynierka/feature/profile_editor/model/time_of_day.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class ProfileEditorState with _$ProfileEditorState {
  const factory ProfileEditorState(
      {int? age,
      int? height,
      int? weight,
      Gender? gender,
      Illness? illness,
      String? firstName,
      String? lastName,
      required List<String> otherMedicines,
      required Anticoagulant anticoagulant,
      required InrRange inrRange,
      required bool notificationsEnabled,
      required TimeOfDay notificationsTime,
      String? ageError,
      String? heightError,
      String? inrRangeError,
      String? notificationTimeError,
      String? weightError}) = _ProfileEditorState;
}

extension SubmitVerification on ProfileEditorState {
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
