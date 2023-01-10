import 'package:apkainzynierka/feature/journal/model/day_summary.dart';
import 'package:flutter/material.dart';

class DaySummaryView extends StatelessWidget {
  final DaySummary model;

  const DaySummaryView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(model.dosage.toString()),
        Text(model.taken.toString()),
        Text(model.anticoagulant.toString()),
        Text(model.otherMedicines.toString()),
        Text(model.inr.toString()),
        Text(model.inrRating.toString()),
      ],
    );
  }
}
