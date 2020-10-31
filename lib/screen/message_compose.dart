import 'package:emailapp/service/Message.dart';
import 'package:emailapp/manager/MessageFormManager.dart';
import 'package:emailapp/provider.dart';
import 'package:flutter/material.dart';

class MessageCompose extends StatefulWidget {
  @override
  _MessageComposeState createState() => _MessageComposeState();
}

class _MessageComposeState extends State<MessageCompose> {

  @override
  Widget build(BuildContext context) {
    MessageFormManager manager = Provider.of(context).fetch(MessageFormManager);

    return Scaffold(
      appBar: AppBar(toolbarHeight: 50, title: Text('Отправить письмо')),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                title: StreamBuilder<String>(
                  stream: manager.email$,
                  builder: (context, snapshot) {
                    return TextField(
                      onChanged: manager.inEmail.add,
                      decoration: InputDecoration(
                          labelText: 'Кому',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          errorText: snapshot.error),
                    );
                  },
                ),
              ),
              ListTile(
                title: StreamBuilder<Object>(
                    stream: manager.subject$,
                    builder: (context, snapshot) {
                      return TextField(
                        onChanged: manager.inSubject.add,
                        decoration: InputDecoration(
                            labelText: 'Заголовок',
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            errorText: snapshot.error),
                      );
                    }),
              ),
              Divider(),
              ListTile(
                title: TextField(
                  onChanged: manager.inbody.add,
                  maxLines: 8,
                  decoration: InputDecoration(
                      labelText: 'Текст',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              ListTile(
                title: StreamBuilder<Object>(
                    stream: manager.isFormValid$,
                    builder: (context, snapshot) {
                      return RaisedButton(
                          child: Text('Отправить'),
                          onPressed: (snapshot.hasData)
                              ? () {
                                  Message message = manager.submit();
                                  Navigator.pop(context, message);
                                }
                              : null);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
