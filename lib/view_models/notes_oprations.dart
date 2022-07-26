import 'package:flutter/cupertino.dart';
import 'package:note_apps/models/note.dart';

class NotesOperations extends ChangeNotifier {
  final List<Note> _notes = <Note>[];

  List<Note> get getNotes {
    return _notes;
  }

  NotesOperations() {
    addNewNote('First Note', 'First Note Description');
  }

  void addNewNote(String tittle, String description, {String? id}) {
    Note note = Note(
        tittle: tittle,
        description: description,
        key: DateTime.now().toString());
    _notes.add(note);
    notifyListeners();
  }

  Note fetchNotes(String? id) {
    return _notes.firstWhere((element) => element.key == id);
  }

  void saveNote(String tittle, String description, {String? id}) {
    Note selectedNote = _notes.firstWhere((element) => element.key == id);

    selectedNote.description = description;
    selectedNote.tittle = tittle;
    notifyListeners();
  }
}
