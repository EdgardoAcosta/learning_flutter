import 'package:emailapp/services/networking.dart';

class Contact {
  final String name;
  final String email;
  final String phone;

  Contact.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        phone = json['phone'];

  static Future<List<Contact>> browse({query}) async {
    NetworkHelper contactsList =
        NetworkHelper('https://jsonplaceholder.typicode.com/users');
    List collation = await contactsList.getData();
    if (collation == null) {
      print('Error on request');
      //TODO:Handel error for user
    }
    Iterable<Contact> _contacts = collation.map((_) => Contact.fromJson(_));

    if (query != null && query.isNotEmpty) {
      _contacts = _contacts
          .where((contact) => contact.name.toLowerCase().contains(query));
    }

    return _contacts.toList();
  }
}
