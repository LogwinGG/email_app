import 'dart:math';

import 'package:flutter/material.dart';

class Contact{
  final String name;
  final String email;
  final String phone;
  final Color color;

  Contact.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      email = json['email'],
      phone = json['phone'],
      color = randColor();






  static Color randColor() {
    List<Color> colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.lightBlue,
      Colors.blue[800],
      Colors.purple[900],
      Colors.black,
      Colors.blueGrey,
      Colors.teal,
      Colors.cyan,
    ];
    Random random = Random();
    int i = random.nextInt(10);
    return colors[i];
  }
}