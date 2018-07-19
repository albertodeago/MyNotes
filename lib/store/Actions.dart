import "package:my_notes/models/Note.dart";


/// Add a note to the store
class ActionAddNote {
  final Note note;

  ActionAddNote({this.note});
}

/// Remove a note from the store
class ActionRemoveNote {
  final String id;

  ActionRemoveNote({this.id});
}

/// Update a note of the store
class ActionUpdateNote {
  final Note note;

  ActionUpdateNote({this.note});
}