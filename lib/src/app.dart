import 'package:flutter/material.dart';
import 'package:flutter_calculator/src/calculator/calculator_operator.dart';
import 'calculator/calculator_button.dart';

import 'calculator/calculator_icon_button.dart';
import 'calculator/result_displayer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _computedValue = "0";
  String _currentOperation = "0";

  CalculatorOperator _currentOperator = CalculatorOperator.NONE;

  double _firstOperand = 0.0;

  double _secondOperand = 0.0;

  addDigit(String value) {
    setState(() {
      if (_computedValue != "0") {
        _computedValue += value;
        _currentOperation += value;

        if (_currentOperator != CalculatorOperator.NONE) {
          _secondOperand = double.parse(value);
          _computeOperation();
        }
      } else {
        _computedValue = value;
        _currentOperation = value;
      }
    });
  }

  void _computeOperation() {
    setState(() {
      switch (_currentOperator) {
        case CalculatorOperator.ADD:
          _computedValue = (_firstOperand + _secondOperand).toString();
          break;
        case CalculatorOperator.SUBTRACT:
          _computedValue = (_firstOperand - _secondOperand).toString();
          break;
        case CalculatorOperator.MULTIPLY:
          _computedValue = (_firstOperand * _secondOperand).toString();
          break;
        case CalculatorOperator.DIVIDE:
          _computedValue = (_firstOperand / _secondOperand).toString();
          break;
        default:
          _computedValue = "0";
      }
    });
  }

  void setFirstOperator() {
    if (_computedValue == "0") return;

    _firstOperand = double.parse(_computedValue);
  }

  void setSecondOperator() {
    _secondOperand = double.parse(_computedValue);
    _computedValue = "0";
  }

  void setCurrentOperator(CalculatorOperator operator) {
    bool isArithmeticOperation;
    bool isNonCompleteArithmeticOperation;

    bool isNumber;

    setState(() {
      RegExp r = RegExp(r'^\s*\d+\s*[\+\-\*\/]\s*$');
      isNonCompleteArithmeticOperation = r.hasMatch(_currentOperation);

      if (!isNonCompleteArithmeticOperation) {
        _currentOperator = operator;

        setFirstOperator();

        r = RegExp(r'^\s*\d+\s*[\+\-\*\/]\s*\d+\s*$');
        isArithmeticOperation = r.hasMatch(_currentOperation);

        num? number = num.tryParse(_computedValue);
        isNumber = number != null;

        if (isArithmeticOperation && isNumber) {
          _currentOperation = _computedValue;
        }

        switch (_currentOperator) {
          case CalculatorOperator.ADD:
            _computedValue += CalculatorOperator.ADD.value;
            break;
          case CalculatorOperator.SUBTRACT:
            _computedValue += CalculatorOperator.SUBTRACT.value;
            break;
          case CalculatorOperator.MULTIPLY:
            _computedValue += CalculatorOperator.MULTIPLY.value;
            break;
          case CalculatorOperator.DIVIDE:
            _computedValue += CalculatorOperator.DIVIDE.value;
            break;
          case CalculatorOperator.NONE:
            _computedValue += CalculatorOperator.NONE.value;
        }

        _currentOperation += _currentOperator.value;
      }
    });
  }

  clearEntry() {
    setState(() {
      _computedValue = "0";
      ;
      _firstOperand = 0.0;
      _secondOperand = 0.0;
      _currentOperator = CalculatorOperator.NONE;
      _currentOperation = "0";
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        // Column is also a layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
        //
        // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
        // action in the IDE, or press "p" in the console), to see the
        // wireframe for each widget.
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    Expanded(
                        child: ResultDisplayer(
                            value: _currentOperation,
                            padding: 2.0,
                            fontSize: 24.0,
                            color: Colors.grey)),
                    Expanded(
                        flex: 2, child: ResultDisplayer(value: _computedValue)),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(name: "MC", onPressedButton: () => {}),
                CalculatorButton(name: "MR", onPressedButton: () => {}),
                CalculatorButton(name: "M+", onPressedButton: () => {}),
                CalculatorButton(name: "M-", onPressedButton: () => {}),
                CalculatorButton(name: "MS", onPressedButton: () => {}),
              ],
            ), // Buttons
          ),
          const SizedBox(height: 5),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(name: "C", onPressedButton: () => {}),
                CalculatorButton(
                    name: "CE", onPressedButton: () => {clearEntry()}),
                CalculatorButton(name: "<", onPressedButton: () => {}),
                CalculatorIconButton(
                    name: "backspace",
                    onPressedButton: () => {},
                    buttonColor: Colors.transparent),
              ],
            ), // Buttons
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(name: "1/x", onPressedButton: () => ()),
                CalculatorButton(name: "x^2", onPressedButton: () => {}),
                CalculatorButton(name: "2√x", onPressedButton: () => {}),
                CalculatorButton(
                    name: "/",
                    onPressedButton: () =>
                        {setCurrentOperator(CalculatorOperator.DIVIDE)}),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                    name: "7",
                    onPressedButton: () => {
                          setState(() {
                            _computedValue = "7";
                          }),
                        }),
                CalculatorButton(
                    name: "8", onPressedButton: () => {addDigit("8")}),
                CalculatorButton(
                    name: "9", onPressedButton: () => {addDigit("9")}),
                CalculatorButton(
                    name: "*",
                    onPressedButton: () =>
                        {setCurrentOperator(CalculatorOperator.MULTIPLY)}),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                    name: "4", onPressedButton: () => {addDigit("4")}),
                CalculatorButton(
                    name: "5", onPressedButton: () => {addDigit("5")}),
                CalculatorButton(
                    name: "6", onPressedButton: () => {addDigit("6")}),
                CalculatorButton(
                    name: "-",
                    onPressedButton: () =>
                        {setCurrentOperator(CalculatorOperator.SUBTRACT)}),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                    name: "1", onPressedButton: () => {addDigit("1")}),
                CalculatorButton(
                    name: "2", onPressedButton: () => {addDigit("2")}),
                CalculatorButton(
                    name: "3", onPressedButton: () => {addDigit("3")}),
                CalculatorButton(
                    name: "+",
                    onPressedButton: () =>
                        {setCurrentOperator(CalculatorOperator.ADD)}),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(name: "+/-", onPressedButton: () => {}),
                CalculatorButton(
                    name: "0", onPressedButton: () => {addDigit("0")}),
                CalculatorButton(name: ",", onPressedButton: () => {}),
                CalculatorButton(
                    name: "=",
                    onPressedButton: () => {_computeOperation()},
                    buttonColor: Colors.blueAccent),
              ],
            ),
          )
        ],
      ),
    );
  }
}
