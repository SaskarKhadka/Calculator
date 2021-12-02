import 'package:flutter/cupertino.dart';

class History extends ChangeNotifier {
  String text = "";

  setHistory(String history) {
    // sets history as the given value
    text = history;
    notifyListeners();
  }
}
