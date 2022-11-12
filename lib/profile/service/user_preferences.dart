import 'package:apkainzynierka/profile/model/gender.dart';
import 'package:apkainzynierka/profile/model/range.dart';
import 'package:logger/logger.dart';

class UserPreferences {
  void update(
      {String? medicine,
      List<String> otherMedicines = const [],
      Range? inrRange,
      int? age,
      int? weight,
      int? height,
      Gender? gender}) {
    final logger = Logger();

    final preferences = {
      "medicine": medicine,
      "otherMedicines": otherMedicines,
      "inrRange": inrRange,
      "age": age,
      "weight": weight,
      "height": height,
      "gender": gender
    };

    logger.i("Saving preferences: $preferences");
  }
}
