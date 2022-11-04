import 'package:apkainzynierka/profile/user_preferences.dart';
import 'package:apkainzynierka/util/time_extensions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../util/range.dart';
import 'gender.dart';
import 'medicine.dart';
import 'notification_manager.dart';
import 'notifications_mode.dart';

part 'profile_state.dart';

const lowestValidInr = 1.0;
const highestValidInr = 3.0;
const validHeightRange = Range(from: 50, to: 250);
const validAgeRange = Range(from: 0, to: 120);
const validWeightRange = Range(from: 0, to: 300);

class ProfileCubit extends Cubit<ProfileState> {
  final NotificationManager _notificationManager;
  final UserPreferences _userPreferences;

  ProfileCubit(this._notificationManager, this._userPreferences)
      : super(ProfileState.initial());

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

  void selectMedicine(Medicine medicine) {
    emit(state.copyWith(selectedMedicine: medicine));
  }

  void setAge(int age) {
    if (validAgeRange.includesInclusively(age)) {
      emit(state.copyWith(age: age, heightError: null));
    } else {
      emit(state.copyWith(ageError: "Age is not within accepted range"));
    }
  }

  void setHeight(int height) {
    if (validHeightRange.includesInclusively(height)) {
      emit(state.copyWith(height: height, heightError: null));
    } else {
      emit(state.copyWith(heightError: "Height is not within accepted range"));
    }
  }

  void setWeight(int weight) {
    if (validAgeRange.includesInclusively(weight)) {
      emit(state.copyWith(weight: weight, weightError: null));
    } else {
      emit(state.copyWith(weightError: "Weight is not within accepted range"));
    }
  }

  void setGender(Gender gender) {
    emit(state.copyWith(gender: gender));
  }
}
