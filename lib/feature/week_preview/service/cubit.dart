import 'package:apkainzynierka/feature/week_preview/model/day_preview.dart';
import 'package:apkainzynierka/feature/week_preview/model/state.dart';
import 'package:apkainzynierka/feature/week_preview/usecase/get_day_previews_for_period.dart';
import 'package:apkainzynierka/util/date.dart';
import 'package:bloc/bloc.dart';

class WeekPreviewCubit extends Cubit<WeekPreviewState> {
  final GetDayPreviewsForPeriod getDayPreviewsForPeriod;

  WeekPreviewCubit(this.getDayPreviewsForPeriod)
      : super(WeekPreviewState(
            days: List.generate(7, (index) => const DayPreview(dosage: 0)))) {
    _fetchData();
  }

  void _fetchData() {
    final thisWeek = Date.today().week;
    emit(state.copyWith(
        days: getDayPreviewsForPeriod(
            start: thisWeek.monday, end: thisWeek.sunday)));
  }

  @override
  void onChange(Change<WeekPreviewState> change) {
    print(change);
    super.onChange(change);
  }
}
