import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String username;

  UserProvider({
    this.username = 'Unknown',
  });

  void setUsername(String username) {
    this.username = username;
    notifyListeners();
  }
}
