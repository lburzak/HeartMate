import 'package:apkainzynierka/domain/model/anticoagulant.dart';
import 'package:apkainzynierka/domain/model/gender.dart';
import 'package:apkainzynierka/domain/model/illness.dart';
import 'package:apkainzynierka/domain/model/inr_range.dart';
import 'package:apkainzynierka/domain/model/profile.dart';
import 'package:apkainzynierka/domain/repository/profile_repository.dart';

class UpdateProfile {
  final ProfileRepository _profileRepository;

  UpdateProfile(this._profileRepository);

  void call(
      {String? firstName,
      String? lastName,
      int? height,
      int? weight,
      int? age,
      Gender? gender,
      Illness? illness,
      required Anticoagulant anticoagulant,
      required InrRange inrRange,
      required List<String> otherMedicines}) {
    final newProfile = Profile(
        firstName: firstName,
        lastName: lastName,
        height: height,
        weight: weight,
        age: age,
        gender: gender,
        anticoagulant: anticoagulant,
        illness: illness,
        inrRange: inrRange,
        otherMedicines: otherMedicines);

    _profileRepository.update(newProfile);
  }
}

class InvalidValueException implements Exception {}
