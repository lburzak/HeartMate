import 'package:apkainzynierka/util/time_extensions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../util/range.dart';
import 'medicine.dart';
import 'notifications_mode.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.initial());

  void save() {}

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

    if (from < 1.0 || to > 3.0) {
      emit(state.copyWith(inrRangeError: "Nieprawidłowa wartość zakresu"));
      return;
    }

    emit(state.copyWith(
        inrRange: Range(from: from, to: to), inrRangeError: null));
  }
}
