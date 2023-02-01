import 'package:apkainzynierka/feature/therapy_report/ui/pdf_report_preview.dart';
import 'package:apkainzynierka/feature/therapy_report/usecase/get_therapy_report.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:provider/provider.dart';

class TherapyReportPage extends StatelessWidget {
  final DateTime periodStart;
  final DateTime periodEnd;

  const TherapyReportPage(
      {super.key, required this.periodStart, required this.periodEnd});

  @override
  Widget build(BuildContext context) {
    final container = TherapyReportContainer();

    return Scaffold(
      body: SafeArea(
        child: Provider<GetTherapyReport>.value(
          value: container.resolve(),
          builder: (context, _) => PdfReportPreview(report: context.read<GetTherapyReport>()(
              start: periodStart, end: periodEnd)),
        ),
      ),
    );
  }
}

class TherapyReportContainer extends KiwiContainer {
  TherapyReportContainer() : super.scoped() {
    registerFactory((container) => GetTherapyReport());
  }
}
