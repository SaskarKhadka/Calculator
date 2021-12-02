import 'package:calculator/components/button.dart';
import 'package:calculator/components/functions_keyboard.dart';
import 'package:calculator/components/keypad.dart';
import 'package:calculator/constants/constants.dart';
import 'package:calculator/state/expression.dart';
import 'package:calculator/state/history.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kDarkBackgroundColour,
      body: OrientationBuilder(builder: (context, orientation) {
        return orientation == Orientation.portrait
            ? Scrollbar(
                child: Column(
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
                          controller:
                              Provider.of<Expression>(context, listen: false)
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
                      height: size.width * 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              top: 3.0,
                              bottom: 3.0,
                              left: 5.0,
                              right: 5.0,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.0,
                                color: Colors.white,
                              ),
                            ),
                            child: const Text(
                              "UNIT CONVERTER",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    const Keypad(),
                  ],
                ),
              )
            : Scrollbar(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Consumer<History>(
                      builder: (context, history, _) => Container(
                        padding: EdgeInsets.only(
                          right: 40.0,
                          top: size.height * 0.03,
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
                      height: size.height * 0.01,
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
                          controller:
                              Provider.of<Expression>(context, listen: false)
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
                      height: size.height * 0.03,
                    ),
                    Row(
                      children: const [
                        Expanded(
                          flex: 5,
                          child: SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child: FunctionsKeyboard(),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child: Keypad(
                              isLandscape: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
      }),
    );
  }
}
