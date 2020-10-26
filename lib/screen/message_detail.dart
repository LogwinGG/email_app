import 'package:flutter/material.dart';

class MessageDetail extends StatelessWidget {
  final String title;
  final String body;

  MessageDetail(this.title, this.body);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: Text(title),
      ),
      body: Container(padding: EdgeInsets.all(16), child: Text(body)),
    );
  }
}
