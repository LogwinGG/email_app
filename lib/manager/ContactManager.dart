import 'dart:async';

import 'package:emailapp/model/Contact.dart';
import 'package:emailapp/service/ContactService.dart';
import 'package:rxdart/rxdart.dart';



class ContactManager{
  final PublishSubject<String> _filterSubject = PublishSubject<String>();

  final PublishSubject<List<Contact>> _colectionSubject = PublishSubject();
  final BehaviorSubject<int> _countSubject = BehaviorSubject<int>();

  Sink<String> get inFilter => _filterSubject.sink;

  Stream<int> get count$ => _countSubject.stream;
  Stream<List<Contact>>  get browse$ => _colectionSubject.stream;

  ContactManager(){
    _filterSubject
        .debounceTime(Duration(milliseconds: 250))
        .switchMap((filter) async* {
          yield await ContactService.browse(query: filter);
        })
        .listen((contacts) => _colectionSubject.add(contacts) );


    _colectionSubject.listen((list) => _countSubject.add(list.length));
  }

  void dispose(){
    _countSubject.close();
    _filterSubject.close();
  }
}