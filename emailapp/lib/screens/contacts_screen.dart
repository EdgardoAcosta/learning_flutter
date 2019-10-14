import 'package:emailapp/models/contact_manager.dart';
import 'package:emailapp/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  ContactManager manager = ContactManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        actions: <Widget>[
          Chip(
            label: StreamBuilder<int>(
                stream: manager.contactCounter,
                builder: (context, snapshot) {
                  return Text(
                    (snapshot.data ?? 0).toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
            backgroundColor: Colors.red,
            padding: EdgeInsets.only(right: 16),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: StreamBuilder<List<String>>(
          stream: manager.contactListNow,
          builder: (context, snapshot) {
            List<String> contacts = snapshot.data;

            return ListView.separated(
              itemCount: contacts != null ? contacts.length : 0,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(contacts[index]),
                );
              },
              separatorBuilder: (context, index) => Divider(),
            );
          }),
    );
  }
}
