import 'package:apkainzynierka/feature/last_inr_measurements/model/state.dart';
import 'package:bloc/bloc.dart';

class LastInrMeasurementsCubit extends Cubit<LastInrMeasurementsState> {
  LastInrMeasurementsCubit()
      : super(const LastInrMeasurementsState(
            therapeuticInrBottom: 0, therapeuticInrTop: 0, measurements: []));

  void selectMeasurement(int index) {
    final measurements = List.generate(
        state.measurements.length,
        (i) => i == index
            ? state.measurements[i].copyWith(isSelected: true)
            : state.measurements[i].copyWith(isSelected: false));

    emit(state.copyWith(measurements: measurements));
  }
}
