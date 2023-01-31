import 'package:apkainzynierka/domain/model/anticoagulant.dart';
import 'package:apkainzynierka/domain/model/gender.dart';
import 'package:apkainzynierka/domain/model/illness.dart';

extension DisplayIllness on Illness? {
  String get readable {
    switch (this) {
      case Illness.artificialValve:
        return "Sztuczna zastawka";
      case Illness.other:
        return "Inne";
      default:
        return "nie podano";
    }
  }
}

extension ReadableGender on Gender? {
  String get readable {
    switch (this) {
      case Gender.male:
        return "Mężczyzna";
      case Gender.female:
        return "Kobieta";
      default:
        return "nie podano";
    }
  }
}

extension DisplayAnticoagulant on Anticoagulant? {
  String get readable {
    switch (this) {
      case Anticoagulant.acenokumarol:
        return "Acenokumarol";
      case Anticoagulant.sintrom:
        return "Sintrom";
      case Anticoagulant.warfin:
        return "Warfarin";
      default:
        return "nie podano";
    }
  }
}
