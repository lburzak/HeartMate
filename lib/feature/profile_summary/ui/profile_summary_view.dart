import 'package:apkainzynierka/feature/profile_editor/ui/view.dart';
import 'package:flutter/material.dart';

class ProfileSummaryView extends StatelessWidget {
  const ProfileSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(children: const [
              SizedBox(
                width: 30,
              ),
              Header(text: "Jan Nowak")
            ]),
            const SizedBox(height: 10),
            Row(children: const [
              SizedBox(
                width: 30,
              ),
              Header(text: "Profil")
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
              SizedBox(width: 30),
              Text('Rodzaj schorzenia'),
              SizedBox(width: 90),
              Text("sztuczna zastawka")
            ]),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
              SizedBox(width: 30),
              Text('Wiek'),
              SizedBox(width: 172),
              Text("50 lat")
            ]),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
              SizedBox(width: 30),
              Text('Waga'),
              SizedBox(width: 167),
              Text("100 kg")
            ]),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
              SizedBox(width: 30),
              Text('Wzrost'),
              SizedBox(width: 158),
              Text("190 cm")
            ]),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
              SizedBox(width: 30),
              Text('Płeć'),
              SizedBox(width: 175),
              Text("mężczyzna")
            ]),
            const SizedBox(height: 20),
            Row(children: const [
              SizedBox(
                width: 30,
              ),
              Header(text: "Terapia")
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
              SizedBox(width: 30),
              Text('Przyjmowany antykoagulant'),
              SizedBox(width: 28),
              Text("warfarin")
            ]),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
              SizedBox(width: 30),
              Text('Przedział INR'),
              SizedBox(width: 120),
              Text("2.5 - 3.0")
            ]),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
              const SizedBox(width: 30),
              Text('Inne leki'),
              const SizedBox(width: 150),
              Text("xyz, abc")
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
}
