import 'package:apkainzynierka/feature/journal/ui/journal_calendar.dart';
import 'package:flutter/material.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: JournalCalendar(),
    );
  }
}
