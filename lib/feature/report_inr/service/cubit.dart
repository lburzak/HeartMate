import 'package:apkainzynierka/feature/report_inr/model/state.dart';
import 'package:apkainzynierka/feature/report_inr/service/routing.dart';
import 'package:apkainzynierka/feature/report_inr/usecase/report_inr.dart';
import 'package:bloc/bloc.dart';

class ReportInrCubit extends Cubit<ReportInrState> {
  final ReportInr _reportInr;
  final ReportInrRouting _routing;

  ReportInrCubit(this._reportInr, this._routing)
      : super(const ReportInrState(inr: null, error: null));

  void setInr(double value) {
    if (value < 0) {
      emit(state.copyWith(error: "Nieprawidłowa wartość"));
      return;
    }

    emit(state.copyWith(error: null, inr: value));
  }

  void submit() {
    final inr = state.inr;

    if (inr != null) {
      _reportInr(inr);
      _routing.finish();
    }
  }
}
