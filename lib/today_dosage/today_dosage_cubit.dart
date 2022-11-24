import 'package:apkainzynierka/today_dosage/state/today_dosage_state.dart';
import 'package:apkainzynierka/today_dosage/today_dosage_navigation_event.dart';
import 'package:bloc/bloc.dart';

class TodayDosageCubit extends Cubit<TodayDosageState> {
  final Sink<TodayDosageNavigationEvent> navigationEventSink;

  TodayDosageCubit(this.navigationEventSink)
      : super(const TodayDosageState(
            taken: false, potency: 0, custom: false, scheduleUndefined: false));

  void toggleTaken() {
    emit(state.copyWith(taken: !state.taken));
  }

  void showCustomDosageScreen() {
    navigationEventSink.add(OpenCustomDosageScreen());
  }
}
