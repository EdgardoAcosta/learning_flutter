import 'package:flutter/material.dart';
import 'screens/connection_screen.dart';

void main() => runApp(BluetoothConsole());

class BluetoothConsole extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: ConnectionScreen.id,
      routes: {ConnectionScreen.id: (context) => ConnectionScreen()},
    );
  }
}
