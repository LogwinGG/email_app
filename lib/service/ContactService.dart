import 'dart:convert';
import 'package:emailapp/model/Contact.dart';
import 'package:http/http.dart' as http;

class ContactService {
  static String _url = 'http://fip.zaiste.net/contacts';

  static Future<List<Contact>> browse({query}) async {

    var response = await http.get("$_url?q=$query");

    List collection = [];
    if (response.statusCode == 200) {
      collection = json.decode(response.body);
    }

    Iterable<Contact> _contacts = collection.map((_) => Contact.fromJson(_)) ;
    
    return _contacts.toList();
  }
}