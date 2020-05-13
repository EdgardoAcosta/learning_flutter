import 'package:flutter/material.dart';
import 'package:emailapp/overseer.dart';

class Provider extends InheritedWidget {
  final Overseer data;

  Provider({Key key, Widget child, @required this.data})
      : super(key: key, child: child);

  static Overseer of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).data;
  }

  static Type _typeOf<T>() => T;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
