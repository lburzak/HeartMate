import 'package:apkainzynierka/domain/model/anticoagulant.dart';
import 'package:apkainzynierka/feature/journal/model/day_summary.dart';
import 'package:apkainzynierka/feature/journal/ui/day_summary_view.dart';
import 'package:apkainzynierka/feature/journal/ui/journal_calendar.dart';
import 'package:flutter/material.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            JournalCalendar(),
            DaySummaryView(
                model: DaySummary(
                    taken: true,
                    anticoagulant: Anticoagulant.warfin,
                    otherMedicines: ["Clatra", "Metmin"],
                    inr: 2.5,
                    dosage: 0.75,
                    inrRating: InrRating.tooLow))
          ],
        ),
      ),
    );
  }
}
