import 'package:calculator/components/button.dart';
import 'package:calculator/constants/constants.dart';
import 'package:calculator/state/expression.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FunctionsKeyboard extends StatelessWidget {
  const FunctionsKeyboard({Key? key}) : super(key: key);

  updateExpression(BuildContext context, String newChar) {
    // updates the expression when numbers or operators are pressed
    Provider.of<Expression>(context, listen: false).updateExpression(newChar);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // padding: EdgeInsets.only(
      //   top: isLandscape ? 10.0 : 25.0,
      // ),
      decoration: BoxDecoration(
        // borderRadius: const BorderRadius.only(
        //   topLeft: Radius.circular(40.0),
        //   topRight: Radius.circular(40.0),
        // ),
        color: kDarkKeyboardBackgroundColour,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Button(
                  text: "√",
                  onClicked: () {
                    updateExpression(context, "√()");
                  },
                  isLandscape: true,
                ),
              ),
              // SizedBox(
              //   width: size.width * 0.05,
              // ),
              Expanded(
                child: Button(
                  text: "3√",
                  onClicked: () {
                    updateExpression(context, "()^(1÷3)");
                    // Provider.of<Expression>(context, listen: false)
                    //     .updateExpression(context, "()");
                  },
                  isLandscape: true,
                ),
              ),
              // SizedBox(
              //   width: size.width * 0.05,
              // ),
              Expanded(
                child: Button(
                  text: "x√",
                  onClicked: () {
                    updateExpression(context, "()^(1÷)");
                  },
                  isLandscape: true,
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: size.height * 0.03,
          // ),
          Row(
            children: [
              Expanded(
                child: Button(
                  text: "sin",
                  onClicked: () {
                    updateExpression(context, "s()");
                    // Provider.of<Expression>(context, listen: false)
                    //     .updateExpression(context, "7");
                  },
                  isLandscape: true,
                ),
              ),
              // SizedBox(
              //   width: size.width * 0.05,
              // ),
              Expanded(
                child: Button(
                  text: "cos",
                  onClicked: () {
                    updateExpression(context, "c()");
                    // Provider.of<Expression>(context, listen: false)
                    //     .updateExpression(context, "8");
                  },
                  isLandscape: true,
                ),
              ),
              // SizedBox(
              //   width: size.width * 0.05,
              // ),
              Expanded(
                child: Button(
                  text: "tan",
                  onClicked: () {
                    updateExpression(context, "t()");
                    // Provider.of<Expression>(context, listen: false)
                    //     .updateExpression(context, "9");
                  },
                  isLandscape: true,
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: size.height * 0.03,
          // ),
          Row(
            children: [
              Expanded(
                child: Button(
                  text: "ln",
                  onClicked: () {
                    updateExpression(context, "L()");
                    // Provider.of<Expression>(context, listen: false)
                    //     .updateExpression(context, "4");
                  },
                  isLandscape: true,
                ),
              ),
              // SizedBox(
              //   width: size.width * 0.05,
              // ),
              Expanded(
                child: Button(
                  text: "1/x",
                  onClicked: () {
                    updateExpression(context, "1÷");
                    // Provider.of<Expression>(context, listen: false)
                    //     .updateExpression(context, "5");
                  },
                  isLandscape: true,
                ),
              ),
              // SizedBox(
              //   width: size.width * 0.05,
              // ),
              Expanded(
                child: Button(
                  text: "e",
                  onClicked: () {
                    updateExpression(context, "e^()");
                    // Provider.of<Expression>(context, listen: false)
                    //     .updateExpression(context, "6");
                  },
                  isLandscape: true,
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: size.height * 0.03,
          // ),
          Row(
            children: [
              Expanded(
                child: Button(
                  text: "e^2",
                  onClicked: () {
                    updateExpression(context, "e^(2)");
                    // Provider.of<Expression>(context, listen: false)
                    //     .updateExpression(context, "1");
                  },
                  isLandscape: true,
                ),
              ),
              // SizedBox(
              //   width: size.width * 0.05,
              // ),
              Expanded(
                child: Button(
                  text: "e^x",
                  onClicked: () {
                    updateExpression(context, "e^()");
                    // Provider.of<Expression>(context, listen: false)
                    //     .updateExpression(context, "2");
                  },
                  isLandscape: true,
                ),
              ),
              // SizedBox(
              //   width: size.width * 0.05,
              // ),
              Expanded(
                child: Button(
                  text: "x^2",
                  onClicked: () {
                    updateExpression(context, "^(2)");
                    // Provider.of<Expression>(context, listen: false)
                    //     .updateExpression(context, "3");
                  },
                  isLandscape: true,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Button(
                  text: "x^3",
                  onClicked: () {
                    updateExpression(context, "^(3)");
                    // Provider.of<Expression>(context, listen: false)
                    //     .updateExpression(context, ".");
                  },
                  isLandscape: true,
                ),
              ),
              Expanded(
                child: Button(
                  text: "x^y",
                  // isOperator: true,
                  onClicked: () {
                    updateExpression(context, "^()");
                  },
                  isLandscape: true,
                ),
              ),
              // SizedBox(
              //   width: size.width * 0.05,
              // ),
              Expanded(
                child: Button(
                  text: "π",
                  onClicked: () {
                    updateExpression(context, "π");
                    // Provider.of<Expression>(context, listen: false)
                    //     .updateExpression(context, "0");
                  },
                  isLandscape: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
