abstract class NoteRepository {
  void updateNoteForDay({required DateTime day, required String content});

  bool existsNoteForDay(DateTime day);

  String? getNoteForDay(DateTime day);
}
