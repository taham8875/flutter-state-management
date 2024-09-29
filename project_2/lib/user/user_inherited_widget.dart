import 'package:flutter/material.dart';

class UserInheritedWidget extends InheritedWidget {
  final String username;
  final Function(String) setUsername;

  const UserInheritedWidget({
    super.key,
    required this.username,
    required this.setUsername,
    required super.child,
  });

  static UserInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserInheritedWidget>();
  }

  @override
  bool updateShouldNotify(UserInheritedWidget oldWidget) {
    return username != oldWidget.username;
  }
}
