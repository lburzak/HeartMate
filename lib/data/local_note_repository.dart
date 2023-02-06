import 'package:apkainzynierka/data/day_encoding.dart';
import 'package:apkainzynierka/domain/repository/note_repository.dart';
import 'package:hive/hive.dart';

class LocalNoteRepository extends NoteRepository {
  final Box<String> _notesBox;

  LocalNoteRepository(this._notesBox);

  @override
  String? getNoteForDay(DateTime day) {
    final key = day.encodeDay();
    return _notesBox.get(key);
  }

  @override
  void updateNoteForDay({required DateTime day, required String content}) {
    final key = day.encodeDay();
    _notesBox.put(key, content);
  }
}