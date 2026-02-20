import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;

  int get getCounter => _counter;

  void counterUp() {
    _counter++;
    notifyListeners();
  }

}
