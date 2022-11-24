import 'package:apkainzynierka/domain/model/dose.dart';
import 'package:apkainzynierka/domain/repository/dose_repository.dart';

class LocalDoseRepository extends DoseRepository {
  @override
  void insertDoseTaken(DateTime dateTime, double potency) {
    // TODO: implement insertDoseTaken
  }

  @override
  void removeDoseFromDay(DateTime dateTime) {
    // TODO: implement removeDoseFromDay
  }

  @override
  Dose? findDoseForDay(DateTime dateTime) {
    return const Dose(potency: 1, custom: false);
  }
}
