import 'dart:async';

import 'package:emailapp/models/contact.dart';
import 'package:rxdart/rxdart.dart';

class ContactManager {
  Stream<List<Contact>> get contactListView =>
      Stream.fromFuture(Contact.browse());

  Stream<List<Contact>> filterCollection({filter}) =>
      Stream.fromFuture(Contact.browse(query: filter));

  final BehaviorSubject<int> _contactCounter = BehaviorSubject<int>();

  Stream<int> get contactCounter => _contactCounter.stream;

  ContactManager() {
    contactListView.listen((list) => _contactCounter.add(list.length));
  }
}
