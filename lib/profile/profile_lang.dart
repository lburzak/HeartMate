import 'package:apkainzynierka/common/validation/validation_error.dart';
import 'package:apkainzynierka/profile/model/gender.dart';

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

  String heightError(ValidationError error) {
    switch (error) {
      case ValidationError.outsideRange:
        return "Height is not within accepted range";
      case ValidationError.invalid:
        return "Height is not valid";
    }
  }

  String weightError(ValidationError error) {
    switch (error) {
      case ValidationError.outsideRange:
        return "Weight is not within accepted range";
      case ValidationError.invalid:
        return "Weight is not valid";
    }
  }

  String ageError(ValidationError error) {
    switch (error) {
      case ValidationError.outsideRange:
        return "Age is not within accepted range";
      case ValidationError.invalid:
        return "Age is not valid";
    }
  }
}
