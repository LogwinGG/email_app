import 'package:emailapp/model/Contact.dart';
import 'package:emailapp/observer.dart';
import 'package:flutter/material.dart';

class ContactListBuilder extends StatelessWidget {
  final Stream<List<Contact>> stream;
  final Function builder;

  const ContactListBuilder({Key key, this.stream, this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer<List<Contact>>(
      stream: stream,

      onSuccess: (context, List<Contact> data) => builder(context, data),

      onError: (context, error) => Text('Ошибка: $error'),
      onWaiting: (context) => LinearProgressIndicator(backgroundColor: Colors.yellow[700].withOpacity(0.8),),
    );
  }
}
