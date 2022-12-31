import 'package:apkainzynierka/domain/model/inr_measurement.dart';

abstract class InrMeasurementRepository {
  void update({required double inr, required DateTime measurementDateTime});

  List<InrMeasurement> findWithinPeriod(
      {required DateTime start, required DateTime end});
}
