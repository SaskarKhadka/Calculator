import 'package:flutter/cupertino.dart';

class History extends ChangeNotifier {
  String text = "";

  setHistory(String history) {
    text = history;
    notifyListeners();
  }
}
