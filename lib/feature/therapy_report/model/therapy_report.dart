import 'package:apkainzynierka/domain/model/gender.dart';
import 'package:apkainzynierka/domain/model/illness.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'journal_entry.dart';

part 'therapy_report.freezed.dart';

@freezed
class TherapyReport with _$TherapyReport {
  const factory TherapyReport(
      {String? firstName,
      String? lastName,
      int? height,
      int? weight,
      int? age,
      Gender? gender,
      Illness? illness,
      required DateTime reportDate,
      required List<JournalEntry> journalEntries,
      required Map<DateTime, double> inrMeasurements}) = _TherapyReportState;
}
