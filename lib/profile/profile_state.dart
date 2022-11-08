part of 'profile_cubit.dart';

@immutable
class ProfileState extends Equatable {
  final Range inrRange;
  final List<String> otherMedicines;
  final NotificationsMode notificationsMode;
  final List<Medicine> availableMedicines;
  final Medicine? selectedMedicine;
  final String? notificationTimeError;
  final String? inrRangeError;
  final int? age;
  final int? weight;
  final int? height;
  final Gender? gender;
  final String? ageError;
  final String? weightError;
  final String? heightError;

  bool get submitEnabled => [
        notificationTimeError,
        inrRangeError,
        ageError,
        weightError,
        heightError
      ].every((prop) => prop == null);

  static ProfileState initial() => const ProfileState(
        inrRange: Range(from: 2, to: 3),
        otherMedicines: [],
        notificationsMode: NotificationsModeDisabled(),
        availableMedicines: Medicine.values,
        age: null,
        weight: null,
        height: null,
        gender: null,
      );

  const ProfileState({
    required this.inrRange,
    required this.otherMedicines,
    required this.notificationsMode,
    required this.availableMedicines,
    this.selectedMedicine,
    this.notificationTimeError,
    this.inrRangeError,
    this.age,
    this.weight,
    this.height,
    this.gender,
    this.ageError,
    this.weightError,
    this.heightError,
  });

  ProfileState copyWith({
    Range? inrRange,
    List<String>? otherMedicines,
    NotificationsMode? notificationsMode,
    List<Medicine>? availableMedicines,
    Medicine? selectedMedicine,
    String? notificationTimeError,
    String? inrRangeError,
    int? age,
    int? weight,
    int? height,
    Gender? gender,
    String? ageError,
    String? weightError,
    String? heightError,
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
      age: age ?? this.age,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      gender: gender ?? this.gender,
      ageError: ageError ?? this.ageError,
      weightError: weightError ?? this.weightError,
      heightError: heightError ?? this.heightError,
    );
  }

  @override
  List<Object?> get props => [
        inrRange,
        otherMedicines,
        notificationsMode,
        availableMedicines,
        selectedMedicine,
        notificationTimeError,
        inrRangeError,
        age,
        weight,
        height,
        gender,
        ageError,
        weightError,
        heightError,
      ];
}
