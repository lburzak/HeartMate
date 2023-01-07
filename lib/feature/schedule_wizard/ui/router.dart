import 'package:apkainzynierka/feature/schedule_wizard/service/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MaterialScheduleWizardRouter implements ScheduleWizardRouter {
  final BuildContext _context;

  MaterialScheduleWizardRouter(this._context);

  @override
  void finish() {
    _context.pop();
  }
}
