import 'gender.dart';

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
}
