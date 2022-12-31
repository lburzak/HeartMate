import 'package:apkainzynierka/domain/model/inr_measurement.dart';

abstract class InrMeasurementsRepository {
  List<InrMeasurement> findWithinPeriod(
      {required DateTime start, required DateTime end});
}
