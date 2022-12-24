import 'package:apkainzynierka/data/day_encoding.dart';
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
}
