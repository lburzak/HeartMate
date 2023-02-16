import 'package:apkainzynierka/main.dart';
import 'package:apkainzynierka/util/date.dart';
import 'package:apkainzynierka/util/time_extensions.dart';
import 'package:apkainzynierka/widget/action_button.dart';
import 'package:apkainzynierka/widget/date_field.dart';
import 'package:apkainzynierka/widget/header.dart';
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
              title: Header(text: "Generuj raport"),
              content: TherapyReportWizard(),
            ));
  }
}

class _TherapyReportWizardState extends State<TherapyReportWizard> {
  DateTime periodStart = Date.today();
  DateTime periodEnd = Date.today();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        DateField(
            dateTime: periodStart,
            onDateSelected: selectStartDate,
            firstDate: DateTime(2022),
            lastDate: DateTime.now(),
            label: "Od"),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: DateField(
              firstDate: DateTime(2022),
              lastDate: DateTime.now(),
              dateTime: periodEnd,
              onDateSelected: selectEndDate,
              label: "Do"),
        ),
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ActionButton(
              onPressed: _goToReportPreview,
              label: "GENERUJ",
              icon: Icons.receipt_long,
            ),
          ),
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
    final args = TherapyReportPageArgs(
        periodStart: periodStart.dayStart, periodEnd: periodEnd.dayEnd);
    context.push("/report/preview?${args.toQueryParams()}");
  }
}
