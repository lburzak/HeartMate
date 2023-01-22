import 'package:apkainzynierka/domain/model/anticoagulant.dart';
import 'package:apkainzynierka/domain/repository/profile_repository.dart';

const int maxPillCuts = 4;

class GetStepDosage {
  final ProfileRepository _profileRepository;

  const GetStepDosage(this._profileRepository);

  double call(int stepIndex) {
    final profile = _profileRepository.getCurrent();
    return getDosageForStep(profile.anticoagulant, stepIndex);
  }

  double getDosageForStep(Anticoagulant anticoagulant, int stepIndex) {
    switch (anticoagulant) {
      case Anticoagulant.sintrom:
        return stepIndex / maxPillCuts;
      case Anticoagulant.warfin:
        return _warfarinDosage(stepIndex);
      case Anticoagulant.acenokumarol:
        return stepIndex / maxPillCuts;
    }
  }

  double _warfarinDosage(int stepIndex) {
    int currentIndex = 0;
    double dosage = 0;

    while (currentIndex < stepIndex) {
      if (currentIndex.isEven) {
        dosage += 3;
      } else {
        dosage += 2;
      }

      currentIndex++;
    }

    return dosage / maxPillCuts;
  }
}
