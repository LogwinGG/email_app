import 'package:emailapp/compose_button.dart';
import 'package:emailapp/message_list.dart';
import 'package:emailapp/app_drawer.dart';
import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: 'Важное',),
              Tab(text: 'Другие',),
            ],
          ),
          //toolbarHeight: 50,
          //titleSpacing: 16.0,
          title: Row(
            children: [
              Text(
                'Входящие ',
              ),
              Icon(Icons.fiber_manual_record,
                  color: Colors.yellow[600], size: 15.0),
              Expanded(child: Text(' 36' /*$countMess*/)), //
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
        body: TabBarView(
          children: [
            MessageList(status: 'important'),
            MessageList(status: 'other')
          ],
        ),
        floatingActionButton: ComposeButton([]),
      ),
    );
  }
}
