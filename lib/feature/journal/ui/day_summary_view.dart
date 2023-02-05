import 'package:apkainzynierka/feature/journal/model/day_summary.dart';
import 'package:apkainzynierka/theme/brand_theme.dart';
import 'package:apkainzynierka/util/lang.dart';
import 'package:apkainzynierka/widget/summary_row.dart';
import 'package:flutter/material.dart';

class DaySummaryView extends StatelessWidget {
  final DaySummary model;

  const DaySummaryView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
              visible: model.taken != null && model.dosage != null,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: TriSummaryRow(
                    label: "Dawka",
                    value: model.dosage.toString(),
                    trailing: model.taken != null
                        ? DoseChip(taken: model.taken!)
                        : null),
              )),
          Visibility(
              visible: model.inr != null,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: TriSummaryRow(
                    label: "INR",
                    value: model.inr.toString(),
                    trailing: model.inrRating != null
                        ? InrChip(model.inrRating!)
                        : null),
              )),
          Visibility(
              visible: model.anticoagulant != null,
              child: TriSummaryRow(
                  label: "Antykoagulant", value: model.anticoagulant.readable)),
          Visibility(
              visible: model.otherMedicines != null &&
                  model.otherMedicines!.isNotEmpty,
              child: TriSummaryRow(
                  label: "Inne leki",
                  value: model.otherMedicines?.join(", ") ?? ""))
        ],
      ),
    );
  }
}

class InrChip extends StatelessWidget {
  final InrRating rating;

  const InrChip(this.rating, {super.key});

  String get label {
    switch (rating) {
      case InrRating.balanced:
        return "W normie";
      case InrRating.tooHigh:
        return "Za wysoki";
      case InrRating.tooLow:
        return "Za niski";
    }
  }

  ChipType get chipType {
    switch (rating) {
      case InrRating.balanced:
        return ChipType.good;
      default:
        return ChipType.warning;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TrailingChip(type: chipType, label: label);
  }
}

class DoseChip extends StatelessWidget {
  final bool taken;

  const DoseChip({super.key, required this.taken});

  String get label => taken ? "Przyjęta" : "Nieprzyjęta";

  ChipType get chipType => taken ? ChipType.good : ChipType.bad;

  @override
  Widget build(BuildContext context) {
    return TrailingChip(type: chipType, label: label);
  }
}

class TrailingChip extends StatelessWidget {
  final ChipType type;
  final String label;

  const TrailingChip({super.key, required this.type, required this.label});

  Icon getIcon(BuildContext context) {
    switch (type) {
      case ChipType.good:
        return Icon(Icons.done,
            color: BrandTheme.of(context).goodTextColor, size: 20);
      case ChipType.warning:
        return Icon(Icons.warning,
            color: BrandTheme.of(context).warningTextColor, size: 20);
      case ChipType.bad:
        return Icon(Icons.close,
            color: BrandTheme.of(context).badTextColor, size: 20);
    }
  }

  Color getBackgroundColor(BuildContext context) {
    switch (type) {
      case ChipType.good:
        return BrandTheme.of(context).goodColor;
      case ChipType.warning:
        return BrandTheme.of(context).warningColor;
      case ChipType.bad:
        return BrandTheme.of(context).badColor;
    }
  }

  Color getTextColor(BuildContext context) {
    switch (type) {
      case ChipType.good:
        return BrandTheme.of(context).goodTextColor;
      case ChipType.warning:
        return BrandTheme.of(context).warningTextColor;
      case ChipType.bad:
        return BrandTheme.of(context).badTextColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 34,
        child: Chip(
          avatar: CircleAvatar(
            backgroundColor: getBackgroundColor(context),
            child: getIcon(context),
          ),
          label: Text(label, style: TextStyle(color: getTextColor(context))),
          backgroundColor: getBackgroundColor(context),
        ),
      ),
    );
  }
}

enum ChipType { good, bad, warning }
