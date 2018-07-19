import "package:my_notes/utils/UuidSingleton.dart";

class Note {
  String id;
  String title;
  bool done;

  Note({this.title: 'default title'}) {
    this.id = new UuidSingleton().v1();
    this.done = false;
  }
}