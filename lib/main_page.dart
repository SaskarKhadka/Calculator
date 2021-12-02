import 'package:calculator/components/button.dart';
import 'package:calculator/constants/constants.dart';
import 'package:calculator/state/expression.dart';
import 'package:calculator/state/history.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart' as math;
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    Provider.of<Expression>(context, listen: false)
        .expressionController
        .dispose();
  }

  // int precedence(String op) {
  //   if (op == "*" || op == "/") {
  //     return 2;
  //   } else if (op == "+" || op == "-") {
  //     return 1;
  //   } else {
  //     return 0;
  //   }
  // }

  String evaluate(String expression) {
    // evaluates the expression
    // if evalueted successfully, returns the answer as string
    // else returns the original expression
    String newExpression = expression
        .replaceAll("×", "*")
        .replaceAll("÷", "/")
        .replaceAll(" ", "");
    // List<String> expressionList = expression.split(" ");
    try {
      math.Parser p = math.Parser();
      math.Expression exp = p.parse(newExpression);
      math.ContextModel cm = math.ContextModel();
      double eval = exp.evaluate(math.EvaluationType.REAL, cm);
      return eval.toString();
    } catch (e) {
      return expression;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kDarkBackgroundColour,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Consumer<History>(
            builder: (context, history, _) => Container(
              padding: const EdgeInsets.only(
                right: 40.0,
              ),
              child: Text(
                history.text,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.width * 0.06,
          ),
          Consumer<Expression>(
            builder: (context, expression, _) => Container(
              // alignment: const Alignment(1, 1),
              padding: const EdgeInsets.only(
                right: 40.0,
                left: 15.0,
              ),
              child: TextField(
                textAlign: TextAlign.right,
                keyboardType: TextInputType.none,
                controller: Provider.of<Expression>(context, listen: false)
                    .expressionController,
                // controller: expressionController,
                // textDirection: TextDirection.rtl,
                autofocus: true,
                style: const TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.width * 0.12,
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 25.0,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
              color: kDarkKeyboardBackgroundColour,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(
                      text: "AC",
                      textColour: kTextColour,
                      onClicked: () {
                        Provider.of<History>(context, listen: false)
                            .setHistory("");
                        Provider.of<Expression>(context, listen: false)
                            .resetExpression();
                      },
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Button(
                      text: "C",
                      textColour: kTextColour,
                      onClicked: () {
                        Provider.of<Expression>(context, listen: false)
                            .expressionController
                            .text = "";
                      },
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Button(
                      text: "↶",
                      textColour: kTextColour,
                      onClicked: () {
                        Provider.of<Expression>(context, listen: false)
                            .setExpression(
                                Provider.of<History>(context, listen: false)
                                    .text);
                        Provider.of<History>(context, listen: false)
                            .setHistory("");
                      },
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Button(
                      text: "÷",
                      textColour: kDarkOperatorColour,
                      onClicked: () {
                        Provider.of<Expression>(context, listen: false)
                            .updateExpression("÷");
                      },
                      isOperator: true,
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(
                      text: "7",
                      onClicked: () {
                        Provider.of<Expression>(context, listen: false)
                            .updateExpression("7");
                      },
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Button(
                      text: "8",
                      onClicked: () {
                        Provider.of<Expression>(context, listen: false)
                            .updateExpression("8");
                      },
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Button(
                      text: "9",
                      onClicked: () {
                        Provider.of<Expression>(context, listen: false)
                            .updateExpression("9");
                      },
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Button(
                      text: "×",
                      // text: "*",
                      textColour: kDarkOperatorColour,
                      isOperator: true,
                      onClicked: () {
                        Provider.of<Expression>(context, listen: false)
                            .updateExpression("×");
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(
                      text: "4",
                      onClicked: () {
                        Provider.of<Expression>(context, listen: false)
                            .updateExpression("4");
                      },
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Button(
                      text: "5",
                      onClicked: () {
                        Provider.of<Expression>(context, listen: false)
                            .updateExpression("5");
                      },
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Button(
                      text: "6",
                      onClicked: () {
                        Provider.of<Expression>(context, listen: false)
                            .updateExpression("6");
                      },
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Button(
                      text: "-",
                      textColour: kDarkOperatorColour,
                      isOperator: true,
                      onClicked: () {
                        Provider.of<Expression>(context, listen: false)
                            .updateExpression("-");
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(
                      text: "1",
                      onClicked: () {
                        Provider.of<Expression>(context, listen: false)
                            .updateExpression("1");
                      },
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Button(
                      text: "2",
                      onClicked: () {
                        Provider.of<Expression>(context, listen: false)
                            .updateExpression("2");
                      },
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Button(
                      text: "3",
                      onClicked: () {
                        Provider.of<Expression>(context, listen: false)
                            .updateExpression("3");
                      },
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Button(
                      text: "+",
                      textColour: kDarkOperatorColour,
                      isOperator: true,
                      onClicked: () {
                        Provider.of<Expression>(context, listen: false)
                            .updateExpression("+");
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(
                      text: ".",
                      onClicked: () {
                        Provider.of<Expression>(context, listen: false)
                            .updateExpression(".");
                      },
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Button(
                      text: "0",
                      onClicked: () {
                        Provider.of<Expression>(context, listen: false)
                            .updateExpression("0");
                      },
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Button(
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
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Button(
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
                          Provider.of<History>(context, listen: false)
                              .setHistory(Provider.of<Expression>(context,
                                      listen: false)
                                  .expressionController
                                  .text);
                          Provider.of<Expression>(context, listen: false)
                              .setExpression(answer);
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
