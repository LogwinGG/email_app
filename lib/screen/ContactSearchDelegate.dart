import 'package:emailapp/manager/ContactManager.dart';
import 'package:emailapp/contact_list_builder.dart';
import 'package:emailapp/model/Contact.dart';
import 'package:emailapp/provider.dart';
import 'package:flutter/material.dart';

class ContactSearchDelegate extends SearchDelegate{

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        close(context, null);
      },
    );
  }

  ContactManager manager;

  @override
  Widget buildSuggestions(BuildContext context) {
    manager = Provider.of(context).fetch(ContactManager);
    manager.inFilter.add(query);

    return ContactListBuilder(
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
              leading: CircleAvatar(backgroundColor: _contact.color.withOpacity(0.6),),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    manager.inFilter.add(query);

    return ContactListBuilder(
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
              leading: CircleAvatar(backgroundColor: _contact.color.withOpacity(0.6),),
            );
          },
        );
      },
    );

  }

  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      //primaryColor: Colors.grey[900],
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.blueGrey[100]),
      //primaryColorBrightness: Brightness.dark,
      //primaryTextTheme: theme.textTheme,
    );
  }

}