import 'package:apkainzynierka/domain/event/inr_reported_event.dart';
import 'package:apkainzynierka/feature/report_inr/model/state.dart';
import 'package:apkainzynierka/feature/report_inr/service/routing.dart';
import 'package:apkainzynierka/feature/report_inr/usecase/report_inr.dart';
import 'package:bloc/bloc.dart';
import 'package:event_bus/event_bus.dart';

class ReportInrCubit extends Cubit<ReportInrState> {
  final ReportInr _reportInr;
  final ReportInrRouting _routing;
  final EventBus _eventBus;

  ReportInrCubit(this._reportInr, this._routing, this._eventBus)
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
      _eventBus.fire(InrReportedEvent());
      _routing.finish();
    }
  }
}
