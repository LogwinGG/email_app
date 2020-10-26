import 'package:emailapp/Overseer.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  final Overseer data;

  const Provider({
    Key key,
    @required this.data,
    @required Widget child,
  })
      : assert(child != null),
        super(key: key, child: child);



  static Overseer of(BuildContext context) {
   return context.dependOnInheritedWidgetOfExactType<Provider>().data  ;
  }



  @override
  bool updateShouldNotify(Provider old) {
    return false;
    //return data != old.data;
  }


}