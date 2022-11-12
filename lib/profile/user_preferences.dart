import 'package:apkainzynierka/profile/range.dart';
import 'package:logger/logger.dart';

import 'gender.dart';
import 'medicine.dart';

class UserPreferences {
  void update(
      {Medicine? medicine,
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
