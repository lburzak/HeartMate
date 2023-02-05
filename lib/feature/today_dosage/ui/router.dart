import 'package:apkainzynierka/feature/custom_dosage/custom_dosage.dart';
import 'package:apkainzynierka/feature/today_dosage/service/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MaterialTodayDosageRouter implements TodayDosageRouter {
  final BuildContext _context;

  MaterialTodayDosageRouter(this._context);

  @override
  void openCustomDosageScreen() {
    CustomDosage.showAsModal(_context);
  }

  @override
  void openScheduleWizard() {
    _context.push('/schedules/current');
  }
}
