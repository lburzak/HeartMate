import 'package:apkainzynierka/domain/repository/inr_measurement_repository.dart';

class ReportInr {
  final InrMeasurementRepository _repository;

  ReportInr(this._repository);

  void call(double value) {
    _repository.insert(inr: value, measurementDateTime: DateTime.now());
  }
}
