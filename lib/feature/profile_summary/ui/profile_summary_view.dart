import 'package:apkainzynierka/domain/model/profile.dart';
import 'package:apkainzynierka/feature/profile_editor/ui/view.dart';
import 'package:apkainzynierka/feature/profile_summary/notification_settings_preview.dart';
import 'package:apkainzynierka/util/lang.dart';
import 'package:flutter/material.dart';

class ProfileSummaryView extends StatelessWidget {
  final Profile model;

  const ProfileSummaryView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(children: [
              const SizedBox(
                width: 30,
              ),
              Header(text: "${model.firstName} ${model.lastName}")
            ]),
            const SizedBox(height: 10),
            Row(children: const [
              SizedBox(
                width: 30,
              ),
              Header(text: "Profil")
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(width: 30),
              Text('Rodzaj schorzenia'),
              SizedBox(width: 90),
              Text(model.illness.readable)
            ]),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(width: 30),
              Text('Wiek'),
              SizedBox(width: 172),
              Text("${model.age}")
            ]),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(width: 30),
              Text('Waga'),
              SizedBox(width: 167),
              Text("${model.weight}")
            ]),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(width: 30),
              Text('Wzrost'),
              SizedBox(width: 158),
              Text("${model.height}")
            ]),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(width: 30),
              Text('Płeć'),
              SizedBox(width: 175),
              Text(model.gender.readable)
            ]),
            const SizedBox(height: 20),
            Row(children: const [
              SizedBox(
                width: 30,
              ),
              Header(text: "Terapia")
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(width: 30),
              Text('Przyjmowany antykoagulant'),
              SizedBox(width: 28),
              Text(model.anticoagulant.readable)
            ]),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(width: 30),
              Text('Przedział INR'),
              SizedBox(width: 120),
              Text("${model.inrRange.from} - ${model.inrRange.to}")
            ]),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(width: 30),
              Text('Inne leki'),
              const SizedBox(width: 150),
              Text(model.otherMedicines.join(", "))
            ]),
            const SizedBox(height: 30),
            Row(children: const [
              SizedBox(
                width: 30,
              ),
              Header(text: "Preferencje")
            ]),
            const NotificationSettingsPreview(),
          ],
        ),
      ),
    );
  }
}
