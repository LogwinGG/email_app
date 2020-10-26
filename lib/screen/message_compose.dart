import 'package:emailapp/Message.dart';
import 'package:emailapp/manager/MessageFormManager.dart';
import 'package:emailapp/observer.dart';
import 'package:emailapp/provider.dart';
import 'package:flutter/material.dart';

class MessageCompose extends StatefulWidget {
  @override
  _MessageComposeState createState() => _MessageComposeState();
}

class _MessageComposeState extends State<MessageCompose> {
  String to;
  String title;
  String body;

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MessageFormManager manager = Provider.of(context).fetch(MessageFormManager);

    return Scaffold(
      appBar: AppBar(toolbarHeight: 50, title: Text('Отправить письмо')),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                title: Observer(
                  stream: manager.email$,
                  onSuccess: (context, data) =>
                      TextField(
                        onChanged: manager.inEmail.add,
                        decoration: InputDecoration(
                            labelText: 'Кому',
                            labelStyle: TextStyle(fontWeight: FontWeight.bold)
                        ),
                        // закоментенный техт для TextFormField
                        //validator: (value) => !value.contains('@')? 'Поле должно содержать email' : null,
                        //onSaved: (value) => to = value,
                      ),
                  onError: (context, error) {
                    return TextField(
                        decoration: InputDecoration(
                            labelText: 'Кому (ошибка)',
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            errorText: 'Это поле не коректно'
                        )
                    );
                  },
                ),
              ),
              ListTile(
                title: TextFormField(

                  validator: (value) {
                    var len = value.length;
                    if (len == 0)
                      return 'Не может быть пустым';
                    else
                    if (len < 4) return 'Должен содеражать больше 4 символов';

                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Заголовок',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                  onSaved: (value) => title = value,
                ),
              ),
              Divider(),
              ListTile(
                title: TextFormField(
                  maxLines: 8,
                  decoration: InputDecoration(
                      labelText: 'Текст',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                  onSaved: (value) => body = value,
                ),
              ),
              ListTile(
                title: RaisedButton(
                  child: Text('Отправить'),
                  onPressed: () {
                    if (this.key.currentState.validate()) {
                      this.key.currentState.save();
                      Message message = (title != null && body != null)
                          ? Message(title, body)
                          : null;
                      Navigator.pop(context, message);
                    }
                  },
                ),
              )
            ],
          ),
        ),)
      ,
    );
  }
}
