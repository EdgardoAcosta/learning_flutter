import 'package:emailapp/models/contact.dart';
import 'package:emailapp/services/contact_manager.dart';
import 'package:emailapp/widgets/contact_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ContactSearch extends SearchDelegate {
  final ContactManager manager;

  ContactSearch({this.manager});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Center(
        child: Text('type more than 3 letters'),
      );
    }

    return ContactListBuilder(
      stream: manager.filterCollection(query: query),
      builder: (context, contacts) {
        ListView.separated(
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
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container();
  }
}
