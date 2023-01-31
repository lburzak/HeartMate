import 'package:apkainzynierka/domain/model/gender.dart';
import 'package:apkainzynierka/domain/model/illness.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class TherapyReportState with _$TherapyReportState {
  const factory TherapyReportState({
    String? firstName,
    String? lastName,
    int? height,
    int? weight,
    int? age,
    Gender? gender,
    Illness? illness,
  }) = _TherapyReportState;
}
