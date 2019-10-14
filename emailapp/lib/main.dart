import 'package:emailapp/screens/messages_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(EmailApp());

class EmailApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.redAccent,
      ),
      home: MessagesScreen(),
    );
  }
}
