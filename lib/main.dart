import 'package:emailapp/Overseer.dart';
import 'package:emailapp/app.dart';
import 'package:flutter/material.dart';
import 'package:emailapp/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      data: Overseer(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColorDark: Colors.blueGrey,
          colorScheme: ColorScheme.dark(),
          accentColor: Colors.grey[700],
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.lightGreenAccent,
              colorScheme: ColorScheme.light()),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: App(),
      ),
    );
  }
}
