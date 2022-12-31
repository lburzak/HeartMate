import 'package:apkainzynierka/data/day_encoding.dart';
import 'package:apkainzynierka/domain/model/inr_measurement.dart';
import 'package:apkainzynierka/domain/repository/inr_measurement_repository.dart';
import 'package:hive/hive.dart';

class LocalInrMeasurementRepository extends InrMeasurementRepository {
  final Box<double> inrMeasurements;

  LocalInrMeasurementRepository(this.inrMeasurements);

  @override
  void update({required double inr, required DateTime measurementDateTime}) {
    final key = measurementDateTime.encodeDay();

    inrMeasurements.put(key, inr);
  }

  @override
  List<InrMeasurement> findWithinPeriod(
      {required DateTime start, required DateTime end}) {
    // TODO: implement findWithinPeriod
    throw UnimplementedError();
  }
}
