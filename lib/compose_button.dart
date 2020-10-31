import 'package:emailapp/service/Message.dart';
import 'package:emailapp/screen/message_compose.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ComposeButton extends StatelessWidget {
  final List<Message> messages;

  ComposeButton(this.messages);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(FontAwesomeIcons.edit ,size: 27,),
        backgroundColor: Colors.yellow[700],
        onPressed: () async{
          Message message = await Navigator.push(context, MaterialPageRoute(builder: (context) => MessageCompose(),));
          if (message != null) {
            messages.add(message);

            Scaffold.of(context).showSnackBar(SnackBar(content: Text('Ваше сообщение было отправленно'),backgroundColor: Colors.lightBlue,));
          }

        }

    );
  }
}
