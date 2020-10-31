import 'dart:async';
import 'package:emailapp/service/Message.dart';
import 'package:rxdart/rxdart.dart';
import 'package:emailapp/mixins/Validation.dart';


class MessageFormManager with Validation{
  final _email = BehaviorSubject<String>();
  Stream<String> get email$ => _email.stream.transform(validateEmail);
  Sink<String> get inEmail => _email.sink;

  final _subject = BehaviorSubject<String>();
  Stream<String> get subject$ => _subject.stream.transform(validateSubject);
  Sink<String> get inSubject => _subject.sink;

  final _body = BehaviorSubject<String>();
  Stream<String> get body$ => _body.stream;
  Sink<String> get inbody => _body.sink;

  Stream<bool> get isFormValid$ => Rx.combineLatest3(email$, subject$, body$, (a, b, c) => true);

   submit(){
    String subject = _subject.value;
    String body = _body.value;

    return Message(subject, body);
  }
}
