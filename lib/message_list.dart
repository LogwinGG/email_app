import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:emailapp/service/Message.dart';
import 'package:emailapp/screen/message_detail.dart';

import 'package:intl/intl.dart'; //date format
import 'package:flutter_slidable/flutter_slidable.dart';

class MessageList extends StatefulWidget {
  final String status;



  MessageList({Key key, this.status})
      : super(key: key);

  @override
  _MessageListState createState() => _MessageListState();

}

class _MessageListState extends State<MessageList> {
  Future<List<Message>> future;
  List<Message> messages;
  dynamic countMess;


  void initState() {
    super.initState();
    fetch();
    countMess = '';
  }

  void fetch() async {
    future = Message.browse(status: widget.status);
    messages = await future;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      // ignore: missing_return
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasError)
              return Center(
                child: Text(
                  'Отсутствует интернет соеденение'
                    //'Ошибка: ${snapshot.error}'
                ),
              );

            List<Message> messages = snapshot.data;
            return ListView.separated(
              itemCount: messages.length,
              separatorBuilder: (context, index) =>
                  Divider(color: Colors.grey[900]),
              itemBuilder: (context, index) {
                Message message = messages[index];
                return Slidable(
                  key: ObjectKey(message),
                  actionPane: SlidableDrawerActionPane(),
                  actions: <Widget>[
                    IconSlideAction(
                      caption: 'Archive',
                      color: Colors.blue,
                      icon: Icons.archive,
                      onTap: () => {},
                    ),
                    IconSlideAction(
                      caption: 'Share',
                      color: Colors.indigo,
                      icon: Icons.share,
                      onTap: () => {},
                    ),
                  ],
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'More',
                      color: Colors.black45,
                      icon: Icons.more_horiz,
                      onTap: () => {},
                    ),
                    IconSlideAction(
                      caption: 'Delete',
                      color: Colors.red,
                      icon: Icons.delete,
                      onTap: (){
                        messages.removeAt(index);
                      },
                    ),
                  ],
                  child: ListTile(
                    title: Text(message.title,
                        style: TextStyle(color: Colors.white)),
                    subtitle: Text(message.body,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white60)),
                    isThreeLine: true,
                    leading: CircleAvatar(
                      child: Text('DN'),
                      backgroundColor: Colors.deepOrange.withOpacity(0.6),
                    ),
                    trailing: Text(
                        DateFormat.Hm().format(DateTime(2020, 09, 30, 18, 44)),
                        style: TextStyle(color: Colors.white60)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                MessageDetail(message.title, message.body),
                          ));
                    },
                  ),
                );
              },
            );

        }
      },
    );
  }

}

