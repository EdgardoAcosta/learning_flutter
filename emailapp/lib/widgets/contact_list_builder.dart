import 'package:emailapp/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ContactListBuilder extends StatelessWidget {
  final Stream<List<Contact>> stream;
  final Function builder;

  const ContactListBuilder({@required this.stream, @required this.builder});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Contact>>(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
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
              return builder(context, contacts);

            default:
              return Center(
                child: Text('Error'),
              );
          }
        });
  }
}
