import 'package:emailapp/app_drawer.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                'Календарь ',
              ),

            ],
          ),
          actions: [
            IconButton(
              color: Colors.indigo[100],
              icon: Icon(Icons.search),
              onPressed: () {
                //showSearch(context: context, delegate: );
              },
            ),
          ],
        ),
        body: Center(child: Text('content Calendar'),)
    );
  }
}
