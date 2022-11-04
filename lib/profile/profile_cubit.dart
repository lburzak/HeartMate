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
    emit(state.copyWith(age: age));
  }

  void setHeight(int height) {
    emit(state.copyWith(height: height));
  }

  void setWeight(int weight) {
    emit(state.copyWith(weight: weight));
  }

  void setGender(Gender gender) {
    emit(state.copyWith(gender: gender));
  }
}
