import 'package:apkainzynierka/feature/report_inr/model/state.dart';
import 'package:apkainzynierka/feature/report_inr/usecase/report_inr.dart';
import 'package:bloc/bloc.dart';

class ReportInrCubit extends Cubit<ReportInrState> {
  final ReportInr _reportInr;

  ReportInrCubit(this._reportInr)
      : super(const ReportInrState(inr: 0.0, error: null));

  void setInr(double value) {
    _reportInr(value);
  }
}
