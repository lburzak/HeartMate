import 'package:apkainzynierka/feature/week_preview/model/day_preview.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class WeekPreviewState with _$WeekPreviewState {
  const factory WeekPreviewState({
    required List<DayPreview> days
}) = _WeekPreviewState;
}
