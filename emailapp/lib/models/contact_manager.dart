import 'dart:async';

class ContactManager {
  List<String> _contacts = ["User 1", "User 2", "User 3"];

  Stream<List<String>> get contactListNow async* {
    for (var i = 0; i < _contacts.length; i++) {
      await Future.delayed(Duration(seconds: 2));
      yield _contacts.sublist(0, i + 1);
    }
  }

  final StreamController<int> _contactCounter = StreamController<int>();

  Stream<int> get contactCounter => _contactCounter.stream;

  ContactManager() {
    contactListNow.listen((list) => _contactCounter.add(list.length));
  }
}
