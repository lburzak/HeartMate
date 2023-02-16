import 'package:apkainzynierka/domain/model/anticoagulant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'journal_entry.freezed.dart';

@freezed
class JournalEntry with _$JournalEntry {
  const factory JournalEntry({
    required DateTime date,
    Anticoagulant? anticoagulant,
    double? scheduledDose,
    double? takenDose,
    required List<String> otherMedicines,
    double? inr
}) = _JournalEntry;
}
