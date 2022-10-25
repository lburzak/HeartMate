import 'package:apkainzynierka/util/range.dart';

import 'medicine.dart';

abstract class UserPreferences {
  void update(
      {Medicine? medicine,
      List<String> otherMedicines = const [],
      Range? inrRange}) {}
}
