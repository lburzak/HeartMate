import 'package:apkainzynierka/feature/journal/model/state.dart';
import 'package:bloc/bloc.dart';

class JournalCubit extends Cubit<JournalState> {
  JournalCubit() : super(const JournalState());

  void onDaySelected(DateTime day) {}
}
