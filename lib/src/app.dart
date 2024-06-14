import 'package:flutter/material.dart';
import 'package:flutter_calculator/src/models/calculator_operator_enum.dart';
import 'package:flutter_calculator/src/models/operation.dart';
import 'package:flutter_calculator/src/services/operation_computer.dart';
import 'widgets/calculator_button.dart';

import 'widgets/calculator_icon_button.dart';
import 'widgets/operation_displayer.dart';
import 'widgets/input_output_displayer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _displayedValue = "0";

  CalculatorOperator _currentOperator = CalculatorOperator.none;

  double _firstOperand = 0.0;

  double _secondOperand = 0.0;

  bool _operationEnded = false;

  Operation _currentOperation = Operation();

  void addDigit(String value) {
    setState(() {
      if (_operationEnded) {
        clearEntry();
        _operationEnded = false;
      }

      if (_displayedValue == "0") {
        _displayedValue = value;
        if (_currentOperation.firstOperand != 0 &&
            _currentOperation.calculatorOperator != CalculatorOperator.none) {
          // _currentOperation.secondOperand = double.parse(value);

          _currentOperation = Operation(
              firstOperand: _firstOperand,
              secondOperand: _secondOperand,
              calculatorOperator: _currentOperator,
              operationEnded: _operationEnded);
        }
      } else {
        if (_currentOperator == CalculatorOperator.none) {
          _displayedValue += value;
        } else {
          if (_currentOperation.firstOperand == 0.0) {
            _displayedValue = value;
          } else {
            if (_currentOperation.secondOperand == 0.0) {
              _displayedValue = "";
            }
            _displayedValue += value;
          }
        }
      }

      if (_currentOperator == CalculatorOperator.none) {
        _firstOperand = double.parse(_displayedValue);
        // _currentOperation.firstOperand = _firstOperand;
        _currentOperation = Operation(
            firstOperand: _firstOperand,
            secondOperand: _secondOperand,
            calculatorOperator: _currentOperator,
            operationEnded: _operationEnded);
      } else {
        if (!_operationEnded) {
          _secondOperand = double.parse(_displayedValue);
          // _currentOperation.secondOperand = double.parse(_displayedValue);

          _currentOperation = Operation(
              firstOperand: _firstOperand,
              secondOperand: _secondOperand,
              calculatorOperator: _currentOperator,
              operationEnded: _operationEnded);
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
        _firstOperand =
            OperationComputer.compute(operation: _currentOperation).toDouble();
        _currentOperator = CalculatorOperator.none;

        _currentOperation = Operation(
            firstOperand: _firstOperand,
            secondOperand: _secondOperand,
            calculatorOperator: _currentOperator,
            operationEnded: _operationEnded);
      } else {
        if (_currentOperation.calculatorOperator != CalculatorOperator.none &&
            _firstOperand != 0.0) {
          _currentOperator = newOperator;

          _currentOperation = Operation(
              firstOperand: _firstOperand,
              secondOperand: _secondOperand,
              calculatorOperator: _currentOperator,
              operationEnded: _operationEnded);

          return;
        }
      }
      if (_currentOperator == CalculatorOperator.none) {
        _currentOperator = newOperator;
        // _currentOperation.calculatorOperator = _currentOperator;

        _currentOperation = Operation(
            firstOperand: _firstOperand,
            secondOperand: _secondOperand,
            calculatorOperator: _currentOperator,
            operationEnded: _operationEnded);
      } else {
        _firstOperand =
            OperationComputer.compute(operation: _currentOperation).toDouble();
        _currentOperator = newOperator;
        // _currentOperation.calculatorOperator = _currentOperator;

        _currentOperation = Operation(
            firstOperand: _firstOperand,
            secondOperand: _secondOperand,
            calculatorOperator: _currentOperator,
            operationEnded: _operationEnded);

        _secondOperand = 0.0;
      }
    });
  }

  void endOperation() {
    setState(() {
      _operationEnded = true;

      try {
        _displayedValue =
            OperationComputer.compute(operation: _currentOperation).toString();
      } on Exception catch (e) {
        // TODO: Implement user feedback for invalid operations
      }

      _currentOperation = Operation(
        firstOperand: _firstOperand,
        secondOperand: _secondOperand,
        calculatorOperator: _currentOperator,
        operationEnded: _operationEnded,
      );
    });
  }

  void clearEntry() {
    setState(() {
      if (!(_currentOperation.isComplete && _currentOperation.operationEnded)) {
        _displayedValue = "0";
        if (_currentOperation.calculatorOperator != CalculatorOperator.none) {
          _secondOperand = double.parse(_displayedValue);
        } else {
          _firstOperand = double.parse(_displayedValue);
        }
        _currentOperation = Operation(
            firstOperand: _firstOperand,
            secondOperand: _secondOperand,
            calculatorOperator: _currentOperator,
            operationEnded: _operationEnded);
      } else {
        clear();
      }
    });
  }

  void backspace() {
    setState(() {
      if (_displayedValue != "") {
        _displayedValue =
            _displayedValue.substring(0, _displayedValue.length - 1);

        if (_displayedValue == "") _displayedValue = "0";

        if (_currentOperation.calculatorOperator != CalculatorOperator.none) {
          _secondOperand = double.parse(_displayedValue);
        } else {
          _firstOperand = double.parse(_displayedValue);
        }

        _currentOperation = Operation(
            firstOperand: _firstOperand,
            secondOperand: _secondOperand,
            calculatorOperator: _currentOperator,
            operationEnded: _operationEnded);
      }
    });
  }

  void plusMinus() {
    setState(() {
      if (_displayedValue != "0") {
        if (_displayedValue[0] == "-") {
          _displayedValue = _displayedValue.substring(1);
        } else {
          _displayedValue = "-" + _displayedValue;
        }
      }

      if (_currentOperation.calculatorOperator != CalculatorOperator.none) {
        _secondOperand = double.parse(_displayedValue);
      } else {
        _firstOperand = double.parse(_displayedValue);
      }

      _currentOperation = Operation(
          firstOperand: _firstOperand,
          secondOperand: _secondOperand,
          calculatorOperator: _currentOperator,
          operationEnded: _operationEnded);
    });
  }

  void setDecimal() {
    setState(() {
      if (_displayedValue != "0") {
        if (!_displayedValue.contains('.') &&
            !_currentOperation.operationEnded) {
          _displayedValue = "$_displayedValue.";
        }
      }
    });
  }

  void clear() {
    setState(() {
      _displayedValue = "0";
      _firstOperand = 0.0;
      _secondOperand = 0.0;
      _currentOperator = CalculatorOperator.none;
      _currentOperation = Operation(
          firstOperand: _firstOperand,
          secondOperand: _secondOperand,
          calculatorOperator: _currentOperator);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8.0, 0),
              child: IconButton(
                icon: const Icon(Icons.pin_invoke_rounded,
                    color: Colors.black87, size: 20.0),
                tooltip: 'Pin calculator',
                onPressed: () {},
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 8.0, 0),
                child: IconButton(
                  icon: const Icon(Icons.history_outlined,
                      color: Colors.black87, size: 20.0),
                  tooltip: 'Operations history',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ], //<Widget>[]
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black87, size: 20.0),
          tooltip: 'Menu',
          onPressed: () {},
        ),
      ),
      body: Column(
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
                      operationToDisplay: Operation(
                          firstOperand: _firstOperand,
                          secondOperand: _secondOperand,
                          calculatorOperator: _currentOperator,
                          operationEnded: _operationEnded),
                    )),
                    Expanded(
                      flex: 2,
                      child: Container(
                          padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                          alignment: Alignment.topRight,
                          child: InputOutputDisplayer(
                            valueToDisplay: _displayedValue,
                          )),
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
          //       CalculatorButton(name: "MC", onPressed: () => {}),
          //       CalculatorButton(name: "MR", onPressed: () => {}),
          //       CalculatorButton(name: "M+", onPressed: () => {}),
          //       CalculatorButton(name: "M-", onPressed: () => {}),
          //       CalculatorButton(name: "MS", onPressed: () => {}),
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
                Expanded(
                  child: CalculatorButton(
                      name: "%",
                      onPressed: () =>
                          setCurrentOperator(CalculatorOperator.modulus),
                      buttonColor: Colors.white70),
                ),
                Expanded(
                  child: CalculatorButton(
                      name: "CE",
                      onPressed: clearEntry,
                      buttonColor: Colors.white70),
                ),
                Expanded(
                  child: CalculatorButton(
                      name: "C", onPressed: clear, buttonColor: Colors.white70),
                ),
                Expanded(
                  child: CalculatorIconButton(
                    name: "backspace_outlined",
                    onPressed: backspace,
                    buttonColor: Colors.white70, // Colors.redAccent,
                  ),
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
                Expanded(
                  child: CalculatorButton(
                      name: "¹/x",
                      onPressed: () =>
                          setCurrentOperator(CalculatorOperator.inverse),
                      buttonColor: Colors.white70),
                ),
                Expanded(
                  child: CalculatorButton(
                      name: "x²",
                      onPressed: () =>
                          setCurrentOperator(CalculatorOperator.square),
                      buttonColor: Colors.white70),
                ),
                Expanded(
                  child: CalculatorButton(
                      name: "²√x",
                      onPressed: () =>
                          setCurrentOperator(CalculatorOperator.squareRoot),
                      buttonColor: Colors.white70),
                ),
                Expanded(
                  child: CalculatorButton(
                      name: "÷",
                      onPressed: () =>
                          setCurrentOperator(CalculatorOperator.divide),
                      buttonColor: Colors.white70),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: CalculatorButton(
                        name: "7", onPressed: () => addDigit("7"))),
                Expanded(
                    child: CalculatorButton(
                        name: "8", onPressed: () => addDigit("8"))),
                Expanded(
                    child: CalculatorButton(
                        name: "9", onPressed: () => addDigit("9"))),
                Expanded(
                  child: CalculatorButton(
                      name: "*",
                      onPressed: () =>
                          setCurrentOperator(CalculatorOperator.multiply),
                      buttonColor: Colors.white70),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: CalculatorButton(
                        name: "4", onPressed: () => addDigit("4"))),
                Expanded(
                    child: CalculatorButton(
                        name: "5", onPressed: () => addDigit("5"))),
                Expanded(
                    child: CalculatorButton(
                        name: "6", onPressed: () => addDigit("6"))),
                Expanded(
                  child: CalculatorButton(
                      name: "-",
                      onPressed: () =>
                          {setCurrentOperator(CalculatorOperator.subtract)},
                      buttonColor: Colors.white70),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: CalculatorButton(
                        name: "1", onPressed: () => addDigit("1"))),
                Expanded(
                    child: CalculatorButton(
                        name: "2", onPressed: () => addDigit("2"))),
                Expanded(
                    child: CalculatorButton(
                        name: "3", onPressed: () => addDigit("3"))),
                Expanded(
                  child: CalculatorButton(
                      name: "+",
                      onPressed: () =>
                          setCurrentOperator(CalculatorOperator.add),
                      buttonColor: Colors.white70),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: CalculatorButton(name: "+/-", onPressed: plusMinus)),
                Expanded(
                    child: CalculatorButton(
                        name: "0", onPressed: () => addDigit("0"))),
                Expanded(
                    child: CalculatorButton(name: ".", onPressed: setDecimal)),
                Expanded(
                  child: CalculatorButton(
                      name: "=",
                      onPressed: endOperation,
                      buttonColor: Colors.blueAccent),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
