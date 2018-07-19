import "package:my_notes/models/Note.dart";
import "package:my_notes/store/Store.dart";
import "package:my_notes/store/Actions.dart";

MyNotesState reducerNote(MyNotesState state, dynamic action) {
  if(action is ActionAddNote) {
    print("adding a note ${action.note.title}");
    return new MyNotesState(
        notes: new List<Note>.from(state.notes)..add(action.note)
    );
  } else if(action is ActionRemoveNote) {
    print("removing a note ${action.id}");
    return new MyNotesState(
      notes: new List<Note>.from(state.notes)..removeWhere((note) => note.id == action.id)
    );
  } else if(action is ActionUpdateNote) {
    print("Updating a note ${action.note.title}");
    return new MyNotesState(
        notes: new List<Note>.from(state.notes)..removeWhere((note) => note.id == action.note.id)..add(action.note)
    );
  }

  return state;
}