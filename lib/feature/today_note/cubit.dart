import 'package:apkainzynierka/domain/repository/note_repository.dart';
import 'package:bloc/bloc.dart';

class TodayNoteCubit extends Cubit<String> {
  final NoteRepository _noteRepository;

  TodayNoteCubit(this._noteRepository) : super("") {
    _pullData();
  }

  void update(String content) {
    _noteRepository.updateNoteForDay(
        day: DateTime.now(),
        content: content
    );

    emit(content);
  }

  void _pullData() {
    final content = _noteRepository.getNoteForDay(DateTime.now());
    emit(content ?? "");
  }
}