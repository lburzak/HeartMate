import 'package:apkainzynierka/feature/schedule_wizard/schedule_wizard.dart';
import 'package:flutter/material.dart';

class ScheduleWizardPage extends StatelessWidget {
  const ScheduleWizardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ScheduleWizard(),
    );
  }
}
