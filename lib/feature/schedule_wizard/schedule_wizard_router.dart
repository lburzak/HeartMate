import 'dart:async';

import 'package:apkainzynierka/feature/schedule_wizard/model/schedule_overlap_answer.dart';
import 'package:flutter/material.dart';

class ScheduleWizardRouter {
  final BuildContext _context;

  ScheduleWizardRouter(this._context);

  Future<ScheduleOverlapAnswer> promptScheduleOverlap() {
    return showDialog<ScheduleOverlapAnswer>(
        context: _context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Istniejący harmonogram'),
              content: const Text(
                  'Dla podanego okresu, harmonogram już istnieje. Czy chcesz przesunąć datę końcową obecnego harmonogramu?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () =>
                      Navigator.pop(context, ScheduleOverlapAnswer.cancel),
                  child: const Text('ANULUJ'),
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.pop(context, ScheduleOverlapAnswer.reschedule),
                  child: const Text('TAK'),
                ),
              ],
            )).then((value) => value ?? ScheduleOverlapAnswer.cancel);
  }
}
