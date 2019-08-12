import 'package:flutter/material.dart';
import 'package:todoey/screens/taska_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TasksScreen()
    );
  }
}
