import 'package:flutter/material.dart';
import 'package:flutter_calculator/src/calculator/calculator_operator_enum.dart';
import 'package:flutter_calculator/src/calculator/operation.dart';
import 'package:flutter_calculator/src/calculator/operation_computer.dart';
import 'calculator/calculator_button.dart';

import 'calculator/calculator_icon_button.dart';
import 'calculator/operation_displayer.dart';
import 'calculator/input_output_displayer.dart';

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
  String _displayedValue = "0";

  CalculatorOperator _currentOperator = CalculatorOperator.NONE;

  double _firstOperand = 0.0;

  double _secondOperand = 0.0;

  bool _operationEnded = false;

  Operation _currentOperation = Operation();

  addDigit(String value) {
    setState(() {
      if (_operationEnded) {
        clearEntry();
        _operationEnded = false;
      }

      if (_displayedValue == "0") {
        _displayedValue = value;
        if(_currentOperation.firstOperand != 0 && _currentOperation.calculatorOperator != CalculatorOperator.NONE)
          {
            _currentOperation.secondOperand = double.parse(value);
          }
      } else {
        if(_currentOperator == CalculatorOperator.NONE) {
          _displayedValue += value;
        } else {
          if(_currentOperation.firstOperand == 0.0) {
            _displayedValue = value;
          } else {
            if (_currentOperation.secondOperand == 0.0) {
              _displayedValue = "";
            }
            _displayedValue += value;
          }
        }
      }

      if (_currentOperator == CalculatorOperator.NONE) {
        _firstOperand = double.parse(_displayedValue);
        _currentOperation.firstOperand = _firstOperand;
      } else {
        if (!_operationEnded) {
          _secondOperand = double.parse(_displayedValue);
          _currentOperation.secondOperand = double.parse(_displayedValue);
        }
      }
    });
  }

  void setFirstOperator() {
    if (_displayedValue == "0") return;

    _firstOperand = double.parse(_displayedValue);
  }

  void setSecondOperator() {
    _secondOperand = double.parse(_displayedValue);
    _displayedValue = "0";
  }

  void setCurrentOperator(CalculatorOperator newOperator) {
    setState(() {
      if (_operationEnded) {
        _operationEnded = false;
        _displayedValue = "0";
        _secondOperand = 0.0;
        _firstOperand = OperationComputer.compute(operation: _currentOperation).toDouble();
        _currentOperation.firstOperand = _firstOperand;
        _currentOperation.operationEnded = _operationEnded;
        _currentOperation.secondOperand = _secondOperand;
        _currentOperator = CalculatorOperator.NONE;
        _currentOperation.calculatorOperator = _currentOperator;
      }
      else{
        if (_currentOperation.calculatorOperator != CalculatorOperator.NONE &&
            _firstOperand != 0.0) {
          _currentOperator = newOperator;
          _currentOperation.calculatorOperator = _currentOperator;
          return;
        }
      }
      if (_currentOperator == CalculatorOperator.NONE) {
        _currentOperator = newOperator;
        _currentOperation.calculatorOperator = _currentOperator;
      } else {
        _firstOperand = OperationComputer.compute(operation: _currentOperation).toDouble();
        _currentOperator = newOperator;
        _currentOperation.calculatorOperator = _currentOperator;
        _secondOperand = 0.0;
      }
    });
  }

  void endOperation() {
    setState(() {
      if (_currentOperation.calculatorOperator != CalculatorOperator.NONE &&
          _secondOperand != 0.0 && !_operationEnded) {
        _operationEnded = true;
        _displayedValue =
            OperationComputer.compute(operation: _currentOperation).toString();
        //  _firstOperand = double.parse(_displayedValue);
        // _currentOperation.firstOperand = double.parse(_displayedValue);
        // _secondOperand = 0.0;
        // _currentOperator = CalculatorOperator.NONE;
        // _currentOperation.firstOperand = _firstOperand;
        // _currentOperation.secondOperand = _secondOperand;
      }
    });
  }

  void clearEntry() {
    setState(() {
      _displayedValue = "0";
      _firstOperand = 0.0;
      _secondOperand = 0.0;
      _currentOperator = CalculatorOperator.NONE;
      _currentOperation.firstOperand = _firstOperand;
      _currentOperation.secondOperand = _secondOperand;
      _currentOperation.calculatorOperator = _currentOperator;
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
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    Expanded(
                      child: OperationDisplayer(
                        firstOperand: _firstOperand,
                        secondOperand: _secondOperand,
                        calculatorOperator: _currentOperator,
                        operationEnded: _operationEnded,
                      )
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                        alignment: Alignment.topRight,
                        child: InputOutputDisplayer(
                          valueToDisplay: _displayedValue,
                          calculatorOperator: _currentOperator,
                        )
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          // Expanded(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     mainAxisSize: MainAxisSize.max,
          //     crossAxisAlignment: CrossAxisAlignment.stretch,
          //     children: [
          //       CalculatorButton(name: "MC", onPressedButton: () => {}),
          //       CalculatorButton(name: "MR", onPressedButton: () => {}),
          //       CalculatorButton(name: "M+", onPressedButton: () => {}),
          //       CalculatorButton(name: "M-", onPressedButton: () => {}),
          //       CalculatorButton(name: "MS", onPressedButton: () => {}),
          //     ],
          //   ), // Buttons
          // ),
          const SizedBox(height: 5),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(name: "%", onPressedButton: () => {}),
                CalculatorButton(
                    name: "CE", onPressedButton: () => {clearEntry()}),
                CalculatorButton(name: "C", onPressedButton: () => {}),
                CalculatorIconButton(
                  name: "backspace_outlined",
                  onPressedButton: () => {},
                  buttonColor: Colors.white // Colors.redAccent,
                ),
              ],
            ), // Buttons
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(name: "¹/x", onPressedButton: () => ()),
                CalculatorButton(name: "x²", onPressedButton: () => {}),
                CalculatorButton(name: "²√x", onPressedButton: () => {}),
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
                    name: "7", onPressedButton: () => {addDigit("7")}),
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
                    onPressedButton: () => {endOperation()},
                    buttonColor: Colors.blueAccent),
              ],
            ),
          )
        ],
      ),
    );
  }
}
