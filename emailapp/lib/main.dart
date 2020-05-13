import 'package:emailapp/provider.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'overseer.dart';

void main() => runApp(EmailApp());

class EmailApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      data: Overseer(),
      child: MaterialApp(
        title: 'Email App',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          accentColor: Colors.redAccent,
        ),
        home: App(),
      ),
    );
  }
}
