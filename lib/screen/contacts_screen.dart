import 'package:emailapp/manager/ContactManager.dart';
import 'package:emailapp/screen/ContactSearchDelegate.dart';
import 'package:emailapp/app_drawer.dart';
import 'package:emailapp/contact_list_builder.dart';
import 'package:emailapp/model/Contact.dart';
import 'package:emailapp/provider.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of(context).fetch(ContactManager);
    manager.inFilter.add('');
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                'Контакты ',
              ),
            ],
          ),
          actions: [
            Chip(
              backgroundColor: Colors.yellow[700],
              label: StreamBuilder<int>(
                stream: manager.count$,
                builder: (context, snapshot) => Text(
                  (snapshot.data ?? 0).toString(),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            IconButton(
              color: Colors.indigo[100],
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: ContactSearchDelegate());
              },
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
            )
          ],
        ),
        body: ContactListBuilder(
            stream: manager.browse$,
            builder: (context, contacts) {
              return ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  Contact _contact = contacts[index];
                  return ListTile(
                    title: Text(_contact.name),
                    subtitle: Text(_contact.email),
                    leading: CircleAvatar(
                      backgroundColor: _contact.color.withOpacity(0.6),
                    ),
                  );
                },
              );
            }));
  }
}
