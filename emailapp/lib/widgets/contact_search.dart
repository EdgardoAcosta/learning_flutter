import 'package:emailapp/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ContactSearch extends SearchDelegate {

  final manager;

  ContactSearch({this.manager});
  
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {},
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

    return StreamBuilder<List<Contact>>(
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
          });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container();
  }
}
