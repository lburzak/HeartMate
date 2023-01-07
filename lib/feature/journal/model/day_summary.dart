import 'package:apkainzynierka/domain/model/anticoagulant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'day_summary.freezed.dart';

@freezed
class DaySummary with _$DaySummary {
  const factory DaySummary(
      {double? dosage,
      Anticoagulant? anticoagulant,
      bool? taken,
      List<String>? otherMedicines,
      double? inr,
      InrRating? inrRating}) = _DaySummary;
}

enum InrRating { tooLow, tooHigh, balanced }
