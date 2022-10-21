part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final Range inrRange;
  final List<String> otherMedicines;
  final NotificationsMode notificationsMode;
  final List<Medicine> availableMedicines;
  final Medicine? selectedMedicine;
  final String? notificationTimeError;
  final String? inrRangeError;

  @override
  List<Object?> get props =>
      [inrRange, notificationsMode, otherMedicines, selectedMedicine];

  static ProfileState initial() => const ProfileState(
      inrRange: Range(from: 2, to: 3),
      otherMedicines: [],
      notificationsMode: NotificationsModeDisabled(),
      availableMedicines: Medicine.values);

  const ProfileState({
    required this.inrRange,
    required this.otherMedicines,
    required this.notificationsMode,
    required this.availableMedicines,
    this.selectedMedicine,
    this.notificationTimeError,
    this.inrRangeError,
  });

  ProfileState copyWith({
    Range? inrRange,
    List<String>? otherMedicines,
    NotificationsMode? notificationsMode,
    List<Medicine>? availableMedicines,
    Medicine? selectedMedicine,
    String? notificationTimeError,
    String? inrRangeError,
  }) {
    return ProfileState(
      inrRange: inrRange ?? this.inrRange,
      otherMedicines: otherMedicines ?? this.otherMedicines,
      notificationsMode: notificationsMode ?? this.notificationsMode,
      availableMedicines: availableMedicines ?? this.availableMedicines,
      selectedMedicine: selectedMedicine ?? this.selectedMedicine,
      notificationTimeError:
          notificationTimeError ?? this.notificationTimeError,
      inrRangeError: inrRangeError ?? this.inrRangeError,
    );
  }
}
