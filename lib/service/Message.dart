import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


part 'Message.g.dart';

@JsonSerializable()
class Message {
  final String title;
  final String body;

  Message(this.title, this.body);

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  static Future<List<Message>> browse({status = 'important'}) async{

    var url = status == 'important'
        ? 'https://run.mocky.io/v3/5f44b811-d1f2-4286-862d-1358459afb95'
        : 'https://run.mocky.io/v3/f35208df-ca2a-4fc3-90f7-54c75f4ae7e1';

    var response = await http.get(url);
    //await Future.delayed(Duration(seconds: 1));
    List collection = [];
    if (response.statusCode == 200) {
      collection = json.decode(response.body);
    }
    List<Message> _messages = collection.map((json) => Message.fromJson(json)).toList() ;

    return _messages;
  }
}