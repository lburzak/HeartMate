import 'package:apkainzynierka/domain/model/anticoagulant.dart';
import 'package:apkainzynierka/domain/model/gender.dart';
import 'package:apkainzynierka/domain/model/illness.dart';
import 'package:apkainzynierka/domain/model/inr_range.dart';
import 'package:apkainzynierka/feature/profile_editor/model/state.dart';
import 'package:apkainzynierka/feature/profile_editor/model/time_of_day.dart';
import 'package:apkainzynierka/feature/profile_editor/usecase/schedule_notifications.dart';
import 'package:apkainzynierka/feature/profile_editor/usecase/update_profile.dart';
import 'package:apkainzynierka/util/time_extensions.dart';
import 'package:bloc/bloc.dart';

const ProfileEditorState _initialState = ProfileEditorState(
    inrRange: InrRange(from: 0, to: 0),
    notificationsEnabled: false,
    otherMedicines: [],
    notificationsTime: TimeOfDay(minute: 0, hour: 12),
    gender: Gender.male,
    anticoagulant: Anticoagulant.acenokumarol,
    illness: Illness.artificialValve);

class ProfileEditorCubit extends Cubit<ProfileEditorState> {
  final UpdateProfile _updateProfile;
  final ScheduleNotifications _scheduleNotifications;

  ProfileEditorCubit(this._updateProfile, this._scheduleNotifications)
      : super(_initialState);

  void save() {
    _updateProfile(
        otherMedicines: state.otherMedicines,
        inrRange: state.inrRange,
        illness: state.illness,
        anticoagulant: state.anticoagulant,
        gender: state.gender,
        age: state.age,
        weight: state.weight,
        height: state.height,
        lastName: state.lastName,
        firstName: state.firstName);

    if (state.notificationsEnabled) {
      final time = state.notificationsTime;
      _scheduleNotifications.call(hour: time.hour, minute: time.minute);
    }
  }

  void enableNotifications() {
    emit(state.copyWith(notificationsEnabled: true));
  }

  void disableNotifications() {
    emit(state.copyWith(notificationsEnabled: false));
  }

  void setNotificationTime(int hour, int minute) {
    if (!hour.isValidHour || !minute.isValidMinute) {
      emit(state.copyWith(notificationTimeError: "Invalid time"));
      return;
    }

    emit(state.copyWith(
        notificationTimeError: null,
        notificationsTime: TimeOfDay(hour: hour, minute: minute)));
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

  void setInrRange(InrRange inrRange) {
    if (inrRange.from > inrRange.to) {
      emit(state.copyWith(
          inrRange: inrRange,
          inrRangeError:
              "Dolna granica zakresu nie może być wyższa niż górna."));
      return;
    }

    if (inrRange.from < 1.0 || inrRange.to > 3.0) {
      emit(state.copyWith(
          inrRange: inrRange, inrRangeError: "Nieprawidłowa wartość zakresu"));
      return;
    }

    emit(state.copyWith(inrRange: inrRange, inrRangeError: null));
  }

  void selectAnticoagulant(Anticoagulant anticoagulant) {
    emit(state.copyWith(anticoagulant: anticoagulant));
  }

  void setAge(int age) {
    if (age < 0) {
      emit(state.copyWith(ageError: "Nieprawidłowa wartość"));
      return;
    }

    emit(state.copyWith(ageError: null, age: age));
  }

  void setHeight(int height) {
    if (height < 0) {
      emit(state.copyWith(heightError: "Nieprawidłowa wartość"));
      return;
    }

    emit(state.copyWith(heightError: null, height: height));
  }

  void setWeight(int weight) {
    if (weight < 0) {
      emit(state.copyWith(ageError: "Nieprawidłowa wartość"));
      return;
    }

    emit(state.copyWith(weightError: null, weight: weight));
  }

  void setGender(Gender? gender) {
    emit(state.copyWith(gender: gender));
  }

  void setFirstName(String name) {}

  void setLastName(String name) {}

  void setAnticoagulant(Anticoagulant value) {}

  void setIllness(Illness? value) {}
}
