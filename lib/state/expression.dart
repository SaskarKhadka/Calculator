import 'package:flutter/cupertino.dart';

class Expression extends ChangeNotifier {
  String text = "";

  updateExpression(String newChar) {
    text += newChar;
    notifyListeners();
  }

  resetExpression() {
    text = "";
    notifyListeners();
  }

  removeLast() {
    text = text.substring(0, text.length - 1);
    notifyListeners();
  }
}
