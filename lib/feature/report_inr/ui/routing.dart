import 'package:apkainzynierka/feature/report_inr/service/routing.dart';
import 'package:flutter/material.dart';

class MaterialReportInrRouting extends ReportInrRouting {
  final BuildContext _context;

  MaterialReportInrRouting(this._context);

  @override
  void finish() {
    Navigator.pop(_context);
  }
}
