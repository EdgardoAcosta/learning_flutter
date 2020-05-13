import 'package:emailapp/services/contact_manager.dart';
import 'package:flutter/material.dart';

import '../overseer.dart';
import '../provider.dart';

class ContactCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of(context).fetch(ContactManager);

    return Chip(
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
    );
  }
}
