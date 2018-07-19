import 'package:uuid/uuid.dart';

class UuidSingleton {
  static final UuidSingleton _singleton = new UuidSingleton._internal();
  Uuid uuid = new Uuid();

  factory UuidSingleton() {
    return _singleton;
  }

  String v1() => this.uuid.v1();

  UuidSingleton._internal();
}
