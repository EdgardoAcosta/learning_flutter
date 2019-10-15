import 'dart:async';

import 'package:emailapp/models/contact.dart';

class ContactManager {
  Stream<List<Contact>> get contactListView =>
      Stream.fromFuture(Contact.browse());

  Stream<List<Contact>> filterCollection({query}) =>
      Stream.fromFuture(Contact.browse(query: query));

  final StreamController<int> _contactCounter = StreamController<int>();

  Stream<int> get contactCounter => _contactCounter.stream;

  ContactManager() {
    contactListView.listen((list) => _contactCounter.add(list.length));
  }
}
