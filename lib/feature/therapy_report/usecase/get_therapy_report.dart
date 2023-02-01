import 'package:apkainzynierka/domain/model/anticoagulant.dart';
import 'package:apkainzynierka/domain/model/gender.dart';
import 'package:apkainzynierka/domain/model/illness.dart';
import 'package:apkainzynierka/feature/therapy_report/model/journal_entry.dart';
import 'package:apkainzynierka/feature/therapy_report/model/therapy_report.dart';

class GetTherapyReport {
  TherapyReport call() {
    final now = DateTime.now();
    final oneDay = Duration(days: 1);
    return TherapyReport(
        reportDate: now,
        age: 24,
        firstName: "Łukasz",
        lastName: "Burzak",
        gender: Gender.male,
        height: 177,
        illness: Illness.other,
        weight: 65,
        journalEntries: List.generate(
            120,
                (index) => JournalEntry(
                date: now.subtract(oneDay),
                scheduledDose: index.isEven ? index % 10 : null,
                takenDose: index.isOdd ? index % 10 : null,
                otherMedicines: ["Metmin", "Clatra"],
                anticoagulant: Anticoagulant.warfin)),
        inrMeasurements: {
          now.subtract(Duration(days: 80)): 1.5,
          now.subtract(Duration(days: 70)): 2,
          now.subtract(Duration(days: 60)): 2.5,
          now.subtract(Duration(days: 50)): 7,
          now.subtract(Duration(days: 40)): 3.5,
          now.subtract(Duration(days: 30)): 3.5,
          now.subtract(Duration(days: 20)): 4.5,
          now.subtract(Duration(days: 10)): 1.5,
        });
  }
}
