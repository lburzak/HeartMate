import 'gender.dart';
import 'medicine.dart';

const male = "mężczyzna";
const female = "kobieta";
const undefined = "nie określono";

class ProfileLang {
  String displayGender(Gender? gender) {
    switch (gender) {
      case Gender.male:
        return male;
      case Gender.female:
        return female;
      default:
        return undefined;
    }
  }

  String displayMedicine(Medicine? medicine) {
    switch (medicine) {
      case Medicine.warfarin:
        return "warfarin";
      case Medicine.sintrom:
        return "sintrom";
      case Medicine.acenokumarol:
        return "acenokumarol";
      default:
        return "wybierz lek";
    }
  }

  Gender? readGender(String? value) {
    switch (value) {
      case male:
        return Gender.male;
      case female:
        return Gender.female;
      default:
        return null;
    }
  }

  Medicine readMedicine(String? value) {
    switch (value) {
      case "warfarin":
        return Medicine.warfarin;
      case "sintrom":
        return Medicine.sintrom;
      case "acenokumarol":
        return Medicine.acenokumarol;
      default:
        return Medicine.warfarin;
    }
  }
}
