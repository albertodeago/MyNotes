import 'package:flutter/material.dart';

// Redux
import "package:redux/redux.dart";

// Store
import "package:my_notes/store/Store.dart";
import "package:my_notes/store/Reducers.dart";

// Models
import "package:my_notes/models/Note.dart";

// UI
import "package:my_notes/ui/App.dart";

void main() {
  final store = new Store<MyNotesState>(reducerNote, initialState: new MyNotesState(notes: [new Note()]));
  final title = "My Notes";

  runApp(new MyNotes(
    title: title,
    store: store
  ));
}
