import 'package:emailapp/services/networking.dart';

class Contact {
  final String name;
  final String email;
  final String phone;

  Contact.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        phone = json['phone'];



        

  static Future browes() async {
    NetworkHelper contactsList =
        NetworkHelper('https://jsonplaceholder.typicode.com/users');
    List collation = await contactsList.getData();
    if (collation == null) {
      print('Error on request');
      //TODO:Handel error for user
    }

    List<Contact> _messages =
        collation.map((json) => Contact.fromJson(json)).toList();

    return _messages;
  }
}
