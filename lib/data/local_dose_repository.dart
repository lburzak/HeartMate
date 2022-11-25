import 'package:apkainzynierka/domain/model/dose.dart';
import 'package:apkainzynierka/domain/repository/dose_repository.dart';
import 'package:apkainzynierka/domain/repository/resource_error.dart';
import 'package:hive/hive.dart';

const _boxNameDoses = "doses";

class LocalDoseRepository extends DoseRepository {
  late Box<Dose> doses = Hive.box(_boxNameDoses);

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
