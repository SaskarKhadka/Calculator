import 'package:calculator/constants/constants.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String? text;
  final Color? textColour;
  final bool isOperator;
  final VoidCallback onClicked;
  final bool isLandscape;
  const Button({
    Key? key,
    required this.text,
    required this.onClicked,
    this.textColour = kDarkButtonColour,
    this.isOperator = false,
    this.isLandscape = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        padding: EdgeInsets.only(
          top: isLandscape ? 5.0 : 20.0,
          bottom: isLandscape ? 10.0 : 25.0,
          right: isLandscape ? 30.0 : 20.0,
          left: isLandscape ? 30.0 : 20.0,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: kDarkKeyboardBackgroundColour, width: 0.75),
          color: kDarkButtonBackgroundColour,
        ),
        child: SizedBox(
          height: 30.0,
          width: 30.0,
          child: Center(
            child: Text(
              text!,
              style: TextStyle(
                fontSize: isOperator ? 30.0 : 20.0,
                // fontWeight: FontWeight,
                color: textColour,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
