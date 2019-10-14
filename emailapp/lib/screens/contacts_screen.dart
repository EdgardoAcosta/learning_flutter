import 'package:emailapp/models/contact.dart';
import 'package:emailapp/models/contact_manager.dart';
import 'package:emailapp/widgets/app_drawer.dart';
import 'package:emailapp/widgets/contact_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Text(
                    (snapshot.data ?? 0).toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
            backgroundColor: Colors.red,
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ContactSearch(manager: manager),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: StreamBuilder<List<Contact>>(
          stream: manager.contactListNow,
          builder:
              (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
            List<Contact> contacts = snapshot.data;

            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return Center(
                  child: SpinKitWanderingCubes(
                    color: Colors.blueAccent,
                    size: 100,
                  ),
                );
              case ConnectionState.done:
                return ListView.separated(
                  itemCount: contacts.length,
                  itemBuilder: (BuildContext context, int index) {
                    Contact _contact = contacts[index];

                    return ListTile(
                      title: Text(_contact.name),
                      subtitle: Text(_contact.email),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                );

              default:
                return Center(
                  child: Text('Error'),
                );
            }
          }),
    );
  }
}
