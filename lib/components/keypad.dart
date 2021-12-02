import 'package:calculator/components/button.dart';
import 'package:calculator/constants/constants.dart';
import 'package:calculator/state/expression.dart';
import 'package:calculator/state/history.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart' as math;
import 'package:provider/provider.dart';
import 'dart:math' as dartmath;

class Keypad extends StatelessWidget {
  final bool isLandscape;
  const Keypad({Key? key, this.isLandscape = false}) : super(key: key);

  updateExpression(BuildContext context, String newChar) {
    // updates the expression when numbers or operators are pressed
    Provider.of<Expression>(context, listen: false).updateExpression(newChar);
  }

  String evaluate(String expression) {
    // evaluates the expression
    // if evalueted successfully, returns the answer as string
    // else returns the original expression
    String newExpression = expression
        .replaceAll("×", "*")
        .replaceAll("÷", "/")
        .replaceAll(" ", "")
        .replaceAll("l", "log")
        .replaceAll("s", "sin")
        .replaceAll("c", "cos")
        .replaceAll("t", "tan")
        .replaceAll("L", "ln")
        .replaceAll("π", "${dartmath.pi}")
        .replaceAll("e", "${dartmath.e}");
    try {
      math.Parser p = math.Parser();
      math.Expression exp = p.parse(newExpression);
      math.ContextModel cm = math.ContextModel();
      double eval = exp.evaluate(math.EvaluationType.REAL, cm);
      if (eval % 1 == 0) {
        return eval.round().toString();
      } else {
        String evalAsString = eval.toString();
        evalAsString = evalAsString.substring(evalAsString.indexOf("."));
        evalAsString = evalAsString.substring(0, evalAsString.indexOf(".")) +
            evalAsString.substring(
              evalAsString.indexOf("."),
            );
        if (evalAsString.length > 7) {
          return eval.toStringAsFixed(7);
        } else {
          return eval.toString();
        }
      }
    } catch (e) {
      return expression;
    }
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
            mainAxisAlignment:
                isLandscape ? MainAxisAlignment.end : MainAxisAlignment.center,
            children: [
              Expanded(
                child: Button(
                  text: "AC",
                  textColour: kTextColour,
                  onClicked: () {
                    Provider.of<History>(context, listen: false).setHistory("");
                    Provider.of<Expression>(context, listen: false)
                        .resetExpression();
                  },
                  isLandscape: isLandscape,
                ),
              ),
              // SizedBox(
              //   width: size.width * 0.05,
              // ),
              Expanded(
                child: Button(
                  text: "( )",
                  textColour: kTextColour,
                  onClicked: () {
                    updateExpression(context, "()");
                    // Provider.of<Expression>(context, listen: false)
                    //     .updateExpression(context, "()");
                  },
                  isLandscape: isLandscape,
                ),
              ),
              // SizedBox(
              //   width: size.width * 0.05,
              // ),
              Expanded(
                child: Button(
                  text: "↶",
                  textColour: kTextColour,
                  onClicked: () {
                    Provider.of<Expression>(context, listen: false)
                        .setExpression(
                            Provider.of<History>(context, listen: false).text);
                    Provider.of<History>(context, listen: false).setHistory("");
                  },
                  isLandscape: isLandscape,
                ),
              ),
              // SizedBox(
              //   width: size.width * 0.05,
              // ),
              Expanded(
                child: Button(
                  text: "÷",
                  textColour: kDarkOperatorColour,
                  onClicked: () {
                    updateExpression(context, "÷");
                  },
                  isLandscape: isLandscape,
                  isOperator: true,
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: size.height * 0.03,
          // ),
          Row(
            mainAxisAlignment:
                isLandscape ? MainAxisAlignment.end : MainAxisAlignment.center,
            children: [
              Expanded(
                child: Button(
                  text: "7",
                  onClicked: () {
                    updateExpression(context, "7");
                    // Provider.of<Expression>(context, listen: false)
                    //     .updateExpression(context, "7");
                  },
                  isLandscape: isLandscape,
                ),
              ),
              // SizedBox(
              //   width: size.width * 0.05,
              // ),
              Expanded(
                child: Button(
                  text: "8",
                  onClicked: () {
                    updateExpression(context, "8");
                    // Provider.of<Expression>(context, listen: false)
                    //     .updateExpression(context, "8");
                  },
                  isLandscape: isLandscape,
                ),
              ),
              // SizedBox(
              //   width: size.width * 0.05,
              // ),
              Expanded(
                child: Button(
                  text: "9",
                  onClicked: () {
                    updateExpression(context, "9");
                    // Provider.of<Expression>(context, listen: false)
                    //     .updateExpression(context, "9");
                  },
                  isLandscape: isLandscape,
                ),
              ),
              // SizedBox(
              //   width: size.width * 0.05,
              // ),
              Expanded(
                child: Button(
                  text: "×",
                  // text: "*",
                  textColour: kDarkOperatorColour,
                  isOperator: true,
                  onClicked: () {
                    updateExpression(context, "×");

                    // Provider.of<Expression>(context, listen: false)
                    //     .updateExpression(context, "×");
                  },
                  isLandscape: isLandscape,
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: size.height * 0.03,
          // ),
          Row(
            mainAxisAlignment:
                isLandscape ? MainAxisAlignment.end : MainAxisAlignment.center,
            children: [
              Expanded(
                child: Button(
                  text: "4",
                  onClicked: () {
                    updateExpression(context, "4");
                    // Provider.of<Expression>(context, listen: false)
                    //     .updateExpression(context, "4");
                  },
                  isLandscape: isLandscape,
                ),
              ),
              // SizedBox(
              //   width: size.width * 0.05,
              // ),
              Expanded(
                child: Button(
                  text: "5",
                  onClicked: () {
                    updateExpression(context, "5");
                    // Provider.of<Expression>(context, listen: false)
                    //     .updateExpression(context, "5");
                  },
                  isLandscape: isLandscape,
                ),
              ),
              // SizedBox(
              //   width: size.width * 0.05,
              // ),
              Expanded(
                child: Button(
                  text: "6",
                  onClicked: () {
                    updateExpression(context, "6");
                    // Provider.of<Expression>(context, listen: false)
                    //     .updateExpression(context, "6");
                  },
                  isLandscape: isLandscape,
                ),
              ),
              // SizedBox(
              //   width: size.width * 0.05,
              // ),
              Expanded(
                child: Button(
                  text: "-",
                  textColour: kDarkOperatorColour,
                  isOperator: true,
                  onClicked: () {
                    updateExpression(context, "-");
                    // Provider.of<Expression>(context, listen: false)
                    //     .updateExpression(context, "-");
                  },
                  isLandscape: isLandscape,
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: size.height * 0.03,
          // ),
          Row(
            mainAxisAlignment:
                isLandscape ? MainAxisAlignment.end : MainAxisAlignment.center,
            children: [
              Expanded(
                child: Button(
                  text: "1",
                  onClicked: () {
                    updateExpression(context, "1");
                    // Provider.of<Expression>(context, listen: false)
                    //     .updateExpression(context, "1");
                  },
                  isLandscape: isLandscape,
                ),
              ),
              // SizedBox(
              //   width: size.width * 0.05,
              // ),
              Expanded(
                child: Button(
                  text: "2",
                  onClicked: () {
                    updateExpression(context, "2");
                    // Provider.of<Expression>(context, listen: false)
                    //     .updateExpression(context, "2");
                  },
                  isLandscape: isLandscape,
                ),
              ),
              // SizedBox(
              //   width: size.width * 0.05,
              // ),
              Expanded(
                child: Button(
                  text: "3",
                  onClicked: () {
                    updateExpression(context, "3");
                    // Provider.of<Expression>(context, listen: false)
                    //     .updateExpression(context, "3");
                  },
                  isLandscape: isLandscape,
                ),
              ),
              // SizedBox(
              //   width: size.width * 0.05,
              // ),
              Expanded(
                child: Button(
                  text: "+",
                  textColour: kDarkOperatorColour,
                  isOperator: true,
                  onClicked: () {
                    updateExpression(context, "+");
                    // Provider.of<Expression>(context, listen: false)
                    //     .updateExpression(context, "+");
                  },
                  isLandscape: isLandscape,
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: size.height * 0.03,
          // ),
          Row(
            mainAxisAlignment:
                isLandscape ? MainAxisAlignment.end : MainAxisAlignment.center,
            children: [
              Expanded(
                child: Button(
                  text: ".",
                  onClicked: () {
                    updateExpression(context, ".");
                    // Provider.of<Expression>(context, listen: false)
                    //     .updateExpression(context, ".");
                  },
                  isLandscape: isLandscape,
                ),
              ),
              // SizedBox(
              //   width: size.width * 0.05,
              // ),
              Expanded(
                child: Button(
                  text: "0",
                  onClicked: () {
                    updateExpression(context, "0");
                    // Provider.of<Expression>(context, listen: false)
                    //     .updateExpression(context, "0");
                  },
                  isLandscape: isLandscape,
                ),
              ),
              // SizedBox(
              //   width: size.width * 0.05,
              // ),
              Expanded(
                child: Button(
                  text: "⌫",
                  // isOperator: true,
                  onClicked: () {
                    if (Provider.of<Expression>(context, listen: false)
                            .expressionController
                            .text !=
                        "") {
                      Provider.of<Expression>(context, listen: false)
                          .removeChar();
                    }
                  },
                  isLandscape: isLandscape,
                ),
              ),
              // SizedBox(
              //   width: size.width * 0.05,
              // ),
              Expanded(
                child: Button(
                  text: "=",
                  textColour: kDarkOperatorColour,
                  isOperator: true,
                  onClicked: () {
                    // evaluate
                    final answer = evaluate(
                        Provider.of<Expression>(context, listen: false)
                            .expressionController
                            .text);
                    if (answer !=
                        Provider.of<Expression>(context, listen: false)
                            .expressionController
                            .text) {
                      Provider.of<History>(context, listen: false).setHistory(
                          Provider.of<Expression>(context, listen: false)
                              .expressionController
                              .text);
                      Provider.of<Expression>(context, listen: false)
                          .setExpression(answer);
                    }
                  },
                  isLandscape: isLandscape,
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: size.height * 0.03,
          // ),
        ],
      ),
    );
  }
}
