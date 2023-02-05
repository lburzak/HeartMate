import 'dart:math';

import 'package:apkainzynierka/domain/usecase/get_today_dosage.dart';
import 'package:apkainzynierka/domain/usecase/report_dose_taken.dart';
import 'package:apkainzynierka/feature/custom_dosage/custom_dosage_state.dart';
import 'package:apkainzynierka/feature/custom_dosage/service/routing.dart';
import 'package:apkainzynierka/feature/schedule_wizard/usecase/get_step_dosage.dart';
import 'package:bloc/bloc.dart';

class CustomDosageCubit extends Cubit<CustomDosageState> {
  final GetStepDosage _getStepDosage;
  final ReportDoseTaken _reportDoseTaken;
  final GetTodayDosage _getTodayDosage;
  final CustomDosageRouting _routing;

  CustomDosageCubit(this._getStepDosage, this._reportDoseTaken, this._routing,
      this._getTodayDosage)
      : super(const CustomDosageState(dosage: 0, step: 0)) {
    _pullData();
  }

  void increment() {
    final step = state.step + 1;
    emit(state.copyWith(dosage: _getStepDosage(step), step: step));
  }

  void decrement() {
    final step = max(0, state.step - 1);
    emit(state.copyWith(dosage: _getStepDosage(step), step: step));
  }

  void save() {
    _reportDoseTaken.custom(state.dosage);
    _routing.close();
  }

  void _pullData() {
    final dosage = _getTodayDosage();

    if (dosage == null) {
      return;
    }

    double currentDosage = 0;
    int step = 0;

    while (currentDosage < dosage) {
      currentDosage = _getStepDosage(step);
      step++;
    }

    emit(state.copyWith(dosage: currentDosage, step: step));
  }
}
