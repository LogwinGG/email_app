
import 'package:emailapp/screen/calendar_screen.dart';
import 'package:emailapp/screen/contacts_screen.dart';
import 'package:emailapp/screen/inbox_screen.dart';
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
        InboxScreen(),
        ContactsScreen(),
        CalendarScreen()
      ].elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[900],
        items: [
          BottomNavigationBarItem(title: Text('Email'),icon: Icon(Icons.mail)),
          BottomNavigationBarItem(title: Text('Контакты'),icon: Icon(Icons.people)),
          BottomNavigationBarItem(title: Text('Календарь'),icon: Icon(Icons.calendar_today)),
        ],
        onTap: _onBarItemTap,
        currentIndex: _selectedIndex,
      ),
    );
  }

  void _onBarItemTap(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
