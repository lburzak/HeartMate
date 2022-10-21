part of 'profile_cubit.dart';

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
