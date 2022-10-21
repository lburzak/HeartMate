part of 'profile_cubit.dart';

class Range {
  final double from;
  final double to;

  const Range({
    required this.from,
    required this.to,
  });
}

extension on int {
  bool isValidHour() => true;

  bool isValidMinute() => true;
}

abstract class NotificationsMode {
  const NotificationsMode();

  NotificationsMode.enabled();
}

class NotificationsModeDisabled extends NotificationsMode {
  const NotificationsModeDisabled();
}

class NotificationsModeEnabled extends NotificationsMode {
  final int hour;
  final int minute;

  NotificationsModeEnabled({
    required this.hour,
    required this.minute,
  }) {
    if (!hour.isValidHour()) {
      throw ArgumentError("Hour is not valid");
    }

    if (!minute.isValidMinute()) {
      throw ArgumentError("Hour is not valid");
    }
  }
}

class ProfileState extends Equatable {
  final Range inrRange;
  final List<String> otherMedicines;
  final NotificationsMode notificationsMode;
  final List<Medicine> availableMedicines;
  final Medicine? selectedMedicine;

  @override
  List<Object?> get props =>
      [inrRange, notificationsMode, otherMedicines, selectedMedicine];

  const ProfileState({
    required this.inrRange,
    required this.otherMedicines,
    required this.notificationsMode,
    required this.availableMedicines,
    this.selectedMedicine,
  });

  static ProfileState initial() => const ProfileState(
      inrRange: Range(from: 2, to: 3),
      otherMedicines: [],
      notificationsMode: NotificationsModeDisabled(),
      availableMedicines: Medicine.values);
}
