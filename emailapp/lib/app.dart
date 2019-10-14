import 'package:emailapp/screens/calendar_screen.dart';
import 'package:emailapp/screens/contacts_screen.dart';
import 'package:emailapp/screens/inbox_screen.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        InoboxScreen(),
        ContactsScreen(),
        CalendarScreen(),
      ].elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('Inbox'),
            icon: Icon(Icons.mail),
          ),
          BottomNavigationBarItem(
            title: Text('Contacts'),
            icon: Icon(Icons.people),
          ),
          BottomNavigationBarItem(
            title: Text('Calendar'),
            icon: Icon(Icons.calendar_today),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (tapViwe) {
          setState(() {
            _selectedIndex = tapViwe;
          });
        },
      ),
    );
  }
}
