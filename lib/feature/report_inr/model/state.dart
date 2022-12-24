import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class ReportInrState with _$ReportInrState {
  const factory ReportInrState({required double inr, required String? error}) =
      _ReportInrState;
}
