import 'package:apkainzynierka/domain/model/dose.dart';

abstract class DoseRepository {
  void insertDoseTaken(DateTime dateTime, double potency);

  void removeDoseFromDay(DateTime dateTime);

  Dose? findDoseForDay(DateTime dateTime);
}
