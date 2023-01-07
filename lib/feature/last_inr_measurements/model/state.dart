import 'package:apkainzynierka/feature/last_inr_measurements/model/measurement.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class LastInrMeasurementsState with _$LastInrMeasurementsState {
  const factory LastInrMeasurementsState(
      {required double therapeuticInrBottom,
      required double therapeuticInrTop,
      required List<Measurement> measurements}) = _LastInrMeasurementsState;
}
