import 'package:apkainzynierka/domain/model/anticoagulant.dart';
import 'package:apkainzynierka/domain/model/gender.dart';
import 'package:apkainzynierka/domain/model/illness.dart';
import 'package:apkainzynierka/domain/model/profile.dart';
import 'package:apkainzynierka/feature/profile_editor/ui/view.dart';
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
              Text(_displayIllness(model.illness))
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
              Text(_displayGender(model.gender))
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
              Text(_displayAnticoagulant(model.anticoagulant))
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
            Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
              SizedBox(width: 30),
              Text('Powiadomienia'),
              SizedBox(width: 100),
              Text("wyłączone")
            ]),
            const SizedBox(height: 218),
            Row(
              children: [
                const SizedBox(width: 312),
                FloatingActionButton(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    child: const Icon(Icons.edit),
                    onPressed: () => {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _displayGender(Gender? gender) {
    switch (gender) {
      case Gender.male:
        return "Mężczyzna";
      case Gender.female:
        return "Kobieta";
      default:
        return "nie podano";
    }
  }

  String _displayIllness(Illness? illness) {
    switch (illness) {
      case Illness.artificialValve:
        return "Sztuczna zastawka";
      case Illness.other:
        return "Inne";
      default:
        return "nie podano";
    }
  }

  String _displayAnticoagulant(Anticoagulant value) {
    switch (value) {
      case Anticoagulant.acenokumarol:
        return "Acenokumarol";
      case Anticoagulant.sintrom:
        return "Sintrom";
      case Anticoagulant.warfin:
        return "Warfarin";
      default:
        return "nie podano";
    }
  }
}
