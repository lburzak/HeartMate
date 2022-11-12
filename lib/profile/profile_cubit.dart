import 'package:apkainzynierka/common/validation/number_validation.dart';
import 'package:apkainzynierka/common/validation/string_validation.dart';
import 'package:apkainzynierka/common/validation/validation_pipeline.dart';
import 'package:apkainzynierka/profile/model/gender.dart';
import 'package:apkainzynierka/profile/model/notifications_mode.dart';
import 'package:apkainzynierka/profile/model/range.dart';
import 'package:apkainzynierka/profile/profile_lang.dart';
import 'package:apkainzynierka/profile/service/notification_manager.dart';
import 'package:apkainzynierka/profile/service/user_preferences.dart';
import 'package:apkainzynierka/profile/state/profile_state.dart';
import 'package:apkainzynierka/util/time_extensions.dart';
import 'package:bloc/bloc.dart';

const lowestValidInr = 1.0;
const highestValidInr = 3.0;
const validHeightRange = Range(from: 50, to: 250);
const validAgeRange = Range(from: 0, to: 120);
const validWeightRange = Range(from: 0, to: 300);

class ProfileCubit extends Cubit<ProfileState> {
  final NotificationManager _notificationManager;
  final UserPreferences _userPreferences;
  final ProfileLang _lang;

  ProfileCubit(this._notificationManager, this._userPreferences, this._lang)
      : super(ProfileState(
          availableMedicines: ["Warfarin", "Acenokumarol", "Sintrom"],
          inrRange: const Range(from: 2, to: 3),
          notificationsMode: NotificationsMode.disabled(),
          otherMedicines: [],
        ));

  void save() {
    _userPreferences.update(
        medicine: state.selectedMedicine,
        otherMedicines: state.otherMedicines,
        inrRange: state.inrRange,
        height: state.height,
        weight: state.weight,
        gender: state.gender,
        age: state.age);

    if (state.notificationsMode is NotificationsModeEnabled) {
      final notificationMode =
          state.notificationsMode as NotificationsModeEnabled;
      _notificationManager.rescheduleDailyNotification(
          notificationMode.hour, notificationMode.minute);
    }
  }

  void enableNotifications() {
    emit(state.copyWith(notificationsMode: NotificationsMode.enabled()));
  }

  void disableNotifications() {
    emit(state.copyWith(notificationsMode: NotificationsMode.disabled()));
  }

  void setNotificationTime(int hour, int minute) {
    if (!hour.isValidHour || !minute.isValidMinute) {
      emit(state.copyWith(notificationTimeError: "Invalid time"));
      return;
    }

    emit(state.copyWith(
        notificationTimeError: null,
        notificationsMode:
            NotificationsMode.enabled(hour: hour, minute: minute)));
  }

  void addOtherMedicine(String medicineName) {
    final cleanedName = medicineName.trim();

    if (state.otherMedicines.contains(medicineName)) {
      return;
    }

    emit(
        state.copyWith(otherMedicines: [...state.otherMedicines, cleanedName]));
  }

  void removeOtherMedicine(String name) {
    emit(state.copyWith(
        otherMedicines:
            state.otherMedicines.where((element) => element != name).toList()));
  }

  void setInrRange(double from, double to) {
    if (from > to) {
      emit(state.copyWith(
          inrRangeError:
              "Dolna granica zakresu nie może być wyższa niż górna."));
      return;
    }

    if (from < lowestValidInr || to > highestValidInr) {
      emit(state.copyWith(inrRangeError: "Nieprawidłowa wartość zakresu"));
      return;
    }

    emit(state.copyWith(
        inrRange: Range(from: from, to: to), inrRangeError: null));
  }

  void selectMedicine(String? medicine) {
    emit(state.copyWith(selectedMedicine: medicine));
  }

  void setAge(String input) {
    ValidationPipeline.of(input).number().withinRange(validAgeRange).when(
        valid: (value) =>
            emit(state.copyWith(age: value.toInt(), ageError: null)),
        invalid: (error) =>
            emit(state.copyWith(ageError: _lang.ageError(error))));
  }

  void setHeight(String input) {
    ValidationPipeline.of(input).number().withinRange(validHeightRange).when(
        valid: (value) =>
            emit(state.copyWith(height: value.toInt(), heightError: null)),
        invalid: (error) =>
            emit(state.copyWith(heightError: _lang.heightError(error))));
  }

  void setWeight(String input) {
    ValidationPipeline.of(input).number().withinRange(validWeightRange).when(
        valid: (value) =>
            emit(state.copyWith(weight: value.toInt(), weightError: null)),
        invalid: (error) =>
            emit(state.copyWith(weightError: _lang.weightError(error))));
  }

  void setGender(Gender? gender) {
    emit(state.copyWith(gender: gender));
  }
}
