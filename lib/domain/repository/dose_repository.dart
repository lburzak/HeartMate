import 'package:apkainzynierka/domain/model/dose.dart';

abstract class DoseRepository {
  void insertDoseTaken(DateTime dateTime, double potency);

  void removeDoseFromDay(DateTime dateTime);

  Dose? findDoseForDay(DateTime dateTime);

  List<Dose> findWithinPeriod({required DateTime start, required DateTime end});

  void updateDose(DateTime dateTime, double potency, bool custom);
}
