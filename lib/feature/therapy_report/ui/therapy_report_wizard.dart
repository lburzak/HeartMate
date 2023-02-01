import 'package:apkainzynierka/main.dart';
import 'package:apkainzynierka/widget/action_button.dart';
import 'package:apkainzynierka/widget/date_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TherapyReportWizard extends StatefulWidget {
  const TherapyReportWizard({super.key});

  @override
  State<TherapyReportWizard> createState() => _TherapyReportWizardState();

  static showAsModal(BuildContext context) {
    showDialog(

        context: context,
        builder: (context) => const AlertDialog(
          content: TherapyReportWizard(),
        ));
  }
}

class _TherapyReportWizardState extends State<TherapyReportWizard> {
  DateTime periodStart = DateTime.now();
  DateTime periodEnd = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        DateField(dateTime: periodStart, onDateSelected: selectStartDate),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: DateField(dateTime: periodEnd, onDateSelected: selectEndDate),
        ),
        SizedBox(
          child: ActionButton(
              onPressed: _goToReportPreview, label: "GENERUJ", icon: Icons.receipt_long, padding: const EdgeInsets.only(top: 12),),
        ),
      ],
    );
  }

  void selectStartDate(DateTime dateTime) {
    setState(() {
      periodStart = dateTime;
    });
  }

  void selectEndDate(DateTime dateTime) {
    setState(() {
      periodEnd = dateTime;
    });
  }

  void _goToReportPreview() {
    final args =
        TherapyReportPageArgs(periodStart: periodStart, periodEnd: periodEnd);
    context.push("/report/preview?${args.toQueryParams()}");
  }
}
