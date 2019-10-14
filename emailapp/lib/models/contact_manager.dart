import 'dart:async';

import 'package:emailapp/models/contact.dart';

class ContactManager {
  Stream<List<Contact>> get contactListNow async* {
    yield await Contact.browes();
  }

  final StreamController<int> _contactCounter = StreamController<int>();

  Stream<int> get contactCounter => _contactCounter.stream;

  ContactManager() {
    contactListNow.listen((list) => _contactCounter.add(list.length));
  }
}
