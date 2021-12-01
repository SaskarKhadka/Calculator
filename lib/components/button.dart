import 'package:calculator/constants/constants.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String? text;
  final Color? textColour;
  final bool isOperator;
  final VoidCallback onClicked;
  const Button({
    Key? key,
    required this.text,
    required this.onClicked,
    this.textColour = kDarkButtonColour,
    this.isOperator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        padding: const EdgeInsets.only(
          top: 15.0,
          bottom: 20.0,
          right: 20.0,
          left: 20.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
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
