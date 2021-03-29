import 'dart:math';

import 'package:flutter/material.dart';

import './answer.dart';
import './buttons.dart';

var first;
var second;
String operators;
var result;
var expression;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void calculate(String value) {
    bool isNumeric(String value) {
      if (value == null) {
        return false;
      }
      return double.tryParse(value) != null;
    }

    if (isNumeric(value) == true &&
        (first == null && second == null) &&
        operators == null) {
      first = value;
      setState(() {
        expression = first;
      });
    } else if (value == '^' &&
        (first != null && second == null) &&
        operators == null) {
      operators = value;
      setState(() {
        expression += value;
      });
    } else if (isNumeric(value) == true &&
        (first != null && second == null) &&
        operators == '^') {
      second = value;
      setState(() {
        expression += value;
      });
    } else if (value == '.' &&
        (first == null && second == null) &&
        operators == null) {
      first = "0" + value;
      setState(() {
        expression = first;
      });
    } else if (value == '-' &&
        (first == null && second == null) &&
        operators == null) {
      first = "-";
      setState(() {
        expression = first;
      });
    } else if (value == '√' &&
        (first == null && second == null) &&
        operators == null) {
      operators = "√";
      setState(() {
        expression = operators;
      });
    } else if (value == '-' &&
        (first == null && second == null) &&
        operators == '√') {
      first = value;
      setState(() {
        expression += value;
      });
    } else if (isNumeric(value) == true &&
        (first == null && second == null) &&
        operators == '√') {
      first = value;
      setState(() {
        expression += value;
      });
    } else if (isNumeric(value) == true &&
        (first != null && second == null) &&
        operators == '√') {
      first += value;
      setState(() {
        expression += value;
      });
    } else if (isNumeric(value) == true &&
        (first != null && second == null) &&
        operators == null) {
      first += value;
      setState(() {
        expression = first;
      });
    } else if (value == "←" &&
        (first != null && second == null) &&
        operators == null) {
      first += value;
      setState(() {
        expression = first;
      });
    } else if (value == '.' &&
        (first != null && second == null) &&
        operators == null) {
      first += value;
      setState(() {
        expression = first;
      });
    } else if (isNumeric(value) == false &&
        (first != null && second == null) &&
        operators == null) {
      operators = value;
      setState(() {
        expression += operators;
      });
    } else if (isNumeric(value) == true &&
        (first != null && second == null) &&
        operators != null) {
      second = value;
      setState(() {
        expression += second;
      });
    } else if (value == '.' &&
        (first != null && second == null) &&
        operators != null) {
      second = "0" + value;
      setState(() {
        expression += second;
      });
    } else if (isNumeric(value) == true &&
        (first != null && second != null) &&
        operators != null) {
      second += value;
      setState(() {
        expression += value;
      });
    } else if (value == '.' &&
        (first != null && second != null) &&
        operators != null) {
      second += value;
      setState(() {
        expression += value;
      });
    } else if (value == '=') {
      switch (operators) {
        case '+':
          {
            expression += "=";
            setState(() {
              result = double.parse(first) + double.parse(second);
              expression += result.toString();
            });

            print(result);
            break;
          }
        case '-':
          {
            expression += "=";
            setState(() {
              result = double.parse(first) - double.parse(second);
              expression += result.toString();
            });

            break;
          }
        case 'x':
          {
            expression += "=";
            setState(() {
              result = double.parse(first) * double.parse(second);
              expression += result.toString();
            });

            break;
          }
        case '%':
          {
            expression += "=";
            setState(() {
              result = double.parse(first) % double.parse(second);
              expression += result.toString();
            });

            break;
          }
        case '÷':
          {
            expression += "=";
            setState(() {
              if (double.parse(second) != 0) {
                result = double.parse(first) / double.parse(second);
                expression += result.toString();
              } else {
                expression = "Error";
              }
            });

            break;
          }
        case '^':
          {
            expression += "=";
            setState(() {
              result = pow(double.parse(first), double.parse(second));
              expression += result.toString();
            });
            break;
          }
        case '√':
          {
            expression += "=";
            setState(() {
              if (double.parse(first) >= 0) {
                result = sqrt(double.parse(first));
                expression += result.toString();
              } else {
                expression = "Error";
              }
            });
            break;
          }
      }
    } else if (value == "AC") {
      first = null;
      second = null;
      operators = null;
      result = null;
      setState(() {
        expression = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Calculator',
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            backgroundColor: Color.fromRGBO(0, 250, 154, 1),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Answer(expression),
              Row(
                children: [
                  Buttons("AC", calculate),
                  Buttons("^", calculate),
                  Buttons("√", calculate),
                  Buttons("÷", calculate),
                ],
              ),
              Row(
                children: [
                  Buttons("7", calculate),
                  Buttons("8", calculate),
                  Buttons("9", calculate),
                  Buttons("x", calculate),
                ],
              ),
              Row(
                children: [
                  Buttons("4", calculate),
                  Buttons("5", calculate),
                  Buttons("6", calculate),
                  Buttons("-", calculate),
                ],
              ),
              Row(
                children: [
                  Buttons("1", calculate),
                  Buttons("2", calculate),
                  Buttons("3", calculate),
                  Buttons("+", calculate),
                ],
              ),
              Row(
                children: [
                  Buttons("%", calculate),
                  Buttons("0", calculate),
                  Buttons(".", calculate),
                  Buttons('=', calculate),
                ],
              ),
            ],
          ),
          backgroundColor: Colors.black,
        ));
  }
}
