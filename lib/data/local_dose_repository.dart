import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/data/day_encoding.dart';
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

  @override
  List<Dose>  findWithinPeriod(
      {required DateTime start, required DateTime end}) {
    return doses.values
        .where((e) => e.dateTaken.isAfter(start.subtract(const Duration(seconds: 1))) && e.dateTaken.isBefore(end.add(const Duration(seconds: 1))))
        .toList();
  }
}
