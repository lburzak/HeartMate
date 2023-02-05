import 'dart:math';

import 'package:apkainzynierka/domain/usecase/report_dose_taken.dart';
import 'package:apkainzynierka/feature/custom_dosage/custom_dosage_state.dart';
import 'package:apkainzynierka/feature/schedule_wizard/usecase/get_step_dosage.dart';
import 'package:bloc/bloc.dart';

class CustomDosageCubit extends Cubit<CustomDosageState> {
  final GetStepDosage _getStepDosage;
  final ReportDoseTaken _reportDoseTaken;

  CustomDosageCubit(this._getStepDosage, this._reportDoseTaken)
      : super(const CustomDosageState(dosage: 0, step: 0));

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
  }
}
