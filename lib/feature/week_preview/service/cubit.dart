import 'package:apkainzynierka/domain/event/today_dose_updated_event.dart';
import 'package:apkainzynierka/feature/week_preview/model/day_preview.dart';
import 'package:apkainzynierka/feature/week_preview/model/state.dart';
import 'package:apkainzynierka/feature/week_preview/usecase/get_day_previews_for_period.dart';
import 'package:apkainzynierka/util/date.dart';
import 'package:bloc/bloc.dart';
import 'package:event_bus/event_bus.dart';

class WeekPreviewCubit extends Cubit<WeekPreviewState> {
  final GetDayPreviewsForPeriod getDayPreviewsForPeriod;
  final EventBus _eventBus;

  WeekPreviewCubit(this.getDayPreviewsForPeriod, this._eventBus)
      : super(WeekPreviewState(
            days: List.generate(
                7, (index) => const DayPreview(dosage: 0, isToday: false)))) {
    _fetchData();

    _eventBus.on<TodayDoseUpdatedEvent>().listen((event) {
      _fetchData();
    });
  }

  void _fetchData() {
    final thisWeek = Date.today().week;
    emit(state.copyWith(
        days: getDayPreviewsForPeriod(
            start: thisWeek.monday, end: thisWeek.sunday)));
  }
}
