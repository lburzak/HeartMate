import 'package:apkainzynierka/feature/week_preview/model/day_preview.dart';
import 'package:apkainzynierka/feature/week_preview/model/state.dart';
import 'package:bloc/bloc.dart';

class WeekPreviewCubit extends Cubit<WeekPreviewState> {
  WeekPreviewCubit()
      : super(WeekPreviewState(
            days: List.generate(7, (index) => const DayPreview(dosage: 0)))) {
    _fetchData();
  }

  void _fetchData() {

  }
}
