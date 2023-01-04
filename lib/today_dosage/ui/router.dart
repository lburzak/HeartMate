import 'package:apkainzynierka/custom_dosage/custom_dosage_view.dart';
import 'package:apkainzynierka/today_dosage/service/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MaterialTodayDosageRouter implements TodayDosageRouter {
  final BuildContext _context;

  MaterialTodayDosageRouter(this._context);

  @override
  void openCustomDosageScreen() {
    showModalBottomSheet(
        context: _context, builder: (_) => const CustomDosageView());
  }

  @override
  void openScheduleWizard() {
    _context.push('/schedules/current');
  }
}
