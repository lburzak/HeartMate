import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/domain/model/dose.dart';
import 'package:apkainzynierka/domain/repository/dose_repository.dart';
import 'package:apkainzynierka/domain/repository/resource_error.dart';
import 'package:hive/hive.dart';

class LocalDoseRepository extends DoseRepository {
  final Box<Dose> doses;

  LocalDoseRepository(BoxDatabase database) : doses = database.dosesBox;

  @override
  void insertDoseTaken(DateTime dateTime, double potency) {
    if (doses.containsKey(dateTime.encodeDay())) {
      throw ResourceAlreadyExistsError();
    }

    final dose = Dose(potency: potency, custom: false, dateTaken: dateTime);

    doses.put(dateTime.encodeDay(), dose);
  }

  @override
  void removeDoseFromDay(DateTime dateTime) {
    final encodedDay = dateTime.encodeDay();

    if (!doses.containsKey(encodedDay)) {
      throw NoSuchResourceError();
    }

    doses.delete(encodedDay);
  }

  @override
  Dose? findDoseForDay(DateTime dateTime) {
    return doses.get(dateTime.encodeDay());
  }
}

extension _DayEncoding on DateTime {
  int encodeDay() => (year - 1970) * month * day;
}
