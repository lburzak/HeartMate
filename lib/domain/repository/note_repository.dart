abstract class NoteRepository {
  void updateNoteForDay({required DateTime day, required String content});

  String? getNoteForDay(DateTime day);
}
