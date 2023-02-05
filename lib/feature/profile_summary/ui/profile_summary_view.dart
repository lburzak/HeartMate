import 'package:apkainzynierka/domain/model/profile.dart';
import 'package:apkainzynierka/feature/profile_editor/ui/view.dart';
import 'package:apkainzynierka/feature/profile_summary/notification_settings_preview.dart';
import 'package:apkainzynierka/util/lang.dart';
import 'package:apkainzynierka/widget/summary_row.dart';
import 'package:flutter/material.dart';

class ProfileSummaryView extends StatelessWidget {
  final Profile model;

  const ProfileSummaryView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(text: "${model.firstName ?? ""} ${model.lastName ?? ""}"),
              const Header(text: "Profil"),
              SummaryRow(
                  label: "Rodzaj schorzenia", value: model.illness.readable),
              SummaryRow(
                  label: "Wiek",
                  value: model.age.toString(),
                  visible: model.age != null),
              SummaryRow(
                  label: "Waga",
                  value: model.weight.toString(),
                  visible: model.weight != null),
              SummaryRow(
                  label: "Wzrost",
                  value: model.height.toString(),
                  visible: model.height != null),
              SummaryRow(label: "Płeć", value: model.gender.readable),
              const Header(text: "Terapia"),
              SummaryRow(
                  label: "Przyjmowany antykoagulant",
                  value: model.anticoagulant.readable),
              SummaryRow(
                  label: "Przedział INR",
                  value: "${model.inrRange.from} - ${model.inrRange.to}"),
              SummaryRow(
                  label: "Inne leki", value: model.otherMedicines.join(", ")),
              const Header(text: "Preferencje"),
              const NotificationSettingsPreview(),
            ],
          ),
        ),
      ),
    );
  }
}
