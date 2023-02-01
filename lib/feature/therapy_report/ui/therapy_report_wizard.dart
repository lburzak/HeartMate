import 'package:apkainzynierka/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TherapyReportWizard extends StatefulWidget {
  const TherapyReportWizard({super.key});

  @override
  State<TherapyReportWizard> createState() => _TherapyReportWizardState();
}

class _TherapyReportWizardState extends State<TherapyReportWizard> {
  DateTime periodStart = DateTime.now();
  DateTime periodEnd = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: _goToReportPreview, child: const Text("Generate")),
    );
  }

  void _goToReportPreview() {
    final args = TherapyReportPageArgs(
        periodStart: periodStart, periodEnd: periodEnd);
    context.push("/report/preview?${args.toQueryParams()}");
  }
}
