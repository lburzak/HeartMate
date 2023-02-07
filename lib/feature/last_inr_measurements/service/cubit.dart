import 'package:apkainzynierka/domain/event/inr_reported_event.dart';
import 'package:apkainzynierka/domain/model/inr_measurement.dart';
import 'package:apkainzynierka/domain/model/inr_range.dart';
import 'package:apkainzynierka/domain/repository/inr_measurement_repository.dart';
import 'package:apkainzynierka/domain/repository/profile_repository.dart';
import 'package:apkainzynierka/feature/last_inr_measurements/model/measurement.dart';
import 'package:apkainzynierka/feature/last_inr_measurements/model/state.dart';
import 'package:apkainzynierka/util/time_extensions.dart';
import 'package:bloc/bloc.dart';
import 'package:event_bus/event_bus.dart';

class LastInrMeasurementsCubit extends Cubit<LastInrMeasurementsState> {
  final InrMeasurementRepository _measurementRepository;
  final ProfileRepository _profileRepository;
  final EventBus _eventBus;

  LastInrMeasurementsCubit(
      this._measurementRepository, this._profileRepository, this._eventBus)
      : super(const LastInrMeasurementsState(
            therapeuticInrBottom: 0, therapeuticInrTop: 0, measurements: [])) {
    _fetchData();
    _eventBus.on<InrReportedEvent>().listen((event) {
      _fetchData();
    });
  }

  void selectMeasurement(int index) {
    final measurements = List.generate(
        state.measurements.length,
        (i) => i == index
            ? state.measurements[i].copyWith(isSelected: true)
            : state.measurements[i].copyWith(isSelected: false));

    emit(state.copyWith(measurements: measurements));
  }

  void _fetchData() {
    final InrRange therapeuticInrRange =
        _profileRepository.getCurrent().inrRange;

    final now = DateTime.now();
    final past30Days = now.subtract(const Duration(days: 30));

    final measurements = _measurementRepository
        .findWithinPeriod(start: past30Days, end: now)
        .map((e) => e.toMeasurement(therapeuticInrRange))
        .map((e) => e.copyWith(reportedAt: e.reportedAt.dayStart))
        .toList();

    emit(state.copyWith(
        measurements: measurements,
        therapeuticInrTop: therapeuticInrRange.to,
        therapeuticInrBottom: therapeuticInrRange.from));
  }
}

extension _InrMeasurementMapping on InrMeasurement {
  Measurement toMeasurement(InrRange therapeuticRange) => Measurement(
      value: inr,
      reportedAt: reportDate,
      isOutsideTherapeuticRange: !therapeuticRange.includes(inr),
      isSelected: false);
}
