import "package:flutter/material.dart";

// Redux
import "package:redux/redux.dart";
import "package:flutter_redux/flutter_redux.dart";

// My Notes State
import "package:my_notes/store/Store.dart";
import "package:my_notes/store/Actions.dart";

// Models
import "package:my_notes/models/Note.dart";


class MyNotes extends StatelessWidget {
  final String title;
  final Store<MyNotesState> store;

  MyNotes({Key key, this.store, this.title});

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<MyNotesState>(
      store: this.store,
      child: new MaterialApp(
        home: new MyHomePage(title: this.title),
        theme: new ThemeData( primarySwatch: Colors.brown )
      )
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(this.title)
      ),
      body: new StoreConnector<MyNotesState, List<Note>>(
        builder: (context, notes) {
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];

              return new CheckboxListTile(
                title: new Text(note.title),
                value: note.done,
                onChanged: (bool value) {
                  print("checked ${value} ${note.done}");
                }
              );

            }
          );
        },
        converter: (store) => store.state.notes
      ),
      floatingActionButton: new StoreConnector<MyNotesState, VoidCallback>(
          builder: (context, callback) {
            return new FloatingActionButton(
              onPressed: callback,
              tooltip: 'Add note',
              child: new Icon(Icons.add)
            );
          },
          converter: (store) {
            return () => store.dispatch(ActionAddNote(note: new Note()));
          }),
    );
  }
}