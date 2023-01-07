import 'package:apkainzynierka/data/day_encoding.dart';
import 'package:apkainzynierka/domain/model/inr_measurement.dart';
import 'package:apkainzynierka/domain/repository/inr_measurement_repository.dart';
import 'package:hive/hive.dart';

class LocalInrMeasurementRepository extends InrMeasurementRepository {
  final Box<InrMeasurement> inrMeasurements;

  LocalInrMeasurementRepository(this.inrMeasurements);

  @override
  void update({required double inr, required DateTime measurementDateTime}) {
    final key = measurementDateTime.encodeDay();
    final measurement =
        InrMeasurement(reportDate: measurementDateTime, inr: inr);
    inrMeasurements.put(key, measurement);
  }

  @override
  List<InrMeasurement> findWithinPeriod(
      {required DateTime start, required DateTime end}) {
    final matchingMeasurements = inrMeasurements.values.where(
        (e) => e.reportDate.isAfter(start) && e.reportDate.isBefore(end));

    return matchingMeasurements.toList();
  }
}
