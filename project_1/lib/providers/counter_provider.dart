import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int count;

  CounterProvider({
    this.count = 0,
  });

  void incrementCounter() {
    count++;
    notifyListeners();
  }

  void decrementCounter() {
    count--;
    notifyListeners();
  }
}
