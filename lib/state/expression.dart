import 'package:flutter/cupertino.dart';

class Expression extends ChangeNotifier {
  // String text = "";
  TextEditingController expressionController = TextEditingController(text: "");

  setExpression(String exp) {
    // sets the expression to the given value
    expressionController.text = exp;
  }

  updateExpression(String newChar) {
    // adds the new character to the expression at the cursor position
    expressionController.text += newChar;
    notifyListeners();
  }

  resetExpression() {
    // resets the expression to empty string
    expressionController.text = "";
    notifyListeners();
  }

  removeChar() {
    // removes a charcter based on the cursor position
    var cursorPos = expressionController.selection.baseOffset;
    if (cursorPos == -1) {
      expressionController.text = expressionController.text
          .substring(0, expressionController.text.length - 1);
    } else if (cursorPos == 0) {
      return;
    } else {
      String newText = expressionController.text.substring(0, cursorPos - 1);
      expressionController.text =
          newText + expressionController.text.substring(cursorPos);

      expressionController.selection =
          TextSelection.fromPosition(TextPosition(offset: cursorPos - 1));
    }

    notifyListeners();
  }
}
