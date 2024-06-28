import 'package:flutter/material.dart';
import 'package:flutter_calculator/src/model/calculator.dart';
import 'package:flutter_calculator/src/model/operation.dart';
import 'package:flutter_calculator/src/view/calculator_screen.dart';
import 'package:flutter_calculator/src/view/components/calculator_app_bar.dart';
import 'model/operator.dart';
import 'view/components/calculator_button.dart';

import 'view/components/calculator_icon_button.dart';
import 'view/components/operation_displayer.dart';
import 'view/components/input_output_displayer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _displayedValue = "0";

  Operator _currentOperator = Operator.none;

  double _firstOperand = 0.0;

  double _secondOperand = 0.0;

  bool _operationEnded = false;

  Operation _currentOperation = Operation();

  /// Adds a digit to the displayed value and updates the current operation.
  ///
  /// The [value] parameter represents the digit to be added.
  /// This method is called when a digit button is pressed in the calculator UI.
  void addDigit(String value) {
    setState(() {
      if (_operationEnded) {
        clearEntry();
      }

      // Update displayed value
      if (_displayedValue == "0") {
        _displayedValue = value;
      } else {
        if (!_currentOperation.secondOperandIsDefined) {
          if (_currentOperation.firstOperandIsDefined) {
            if (_currentOperation.secondOperand != double.minPositive) {
              _displayedValue = _displayedValue + value;
            } else {
              _displayedValue = value;
            }
          } else {
            _displayedValue = _displayedValue + value;
          }
        } else {
          _displayedValue += value;
        }
      }

      if (!_currentOperation.firstOperandIsDefined) {
        _firstOperand = double.parse(_displayedValue);
        _currentOperation =
            _currentOperation.copyWith(firstOperand: _firstOperand);
      } else if (!_currentOperation.secondOperandIsDefined) {
        _secondOperand = double.parse(_displayedValue);
        _currentOperation =
            _currentOperation.copyWith(secondOperand: _secondOperand);
      } else {
        _currentOperation.clear();
        _firstOperand = double.parse(_displayedValue);
        _currentOperator = Operator.none;
        _currentOperation = _currentOperation.copyWith(
            firstOperand: _firstOperand, calculatorOperator: _currentOperator);
      }

      if (_operationEnded) {
        _operationEnded = false;
        _currentOperation.operationEnded = _operationEnded;
      }
    });
  }

  /// Sets the first operator.
  void setFirstOperator() {
    if (_displayedValue == "0") return;

    _firstOperand = double.parse(_displayedValue);
  }

  /// Sets the second operator.
  void setSecondOperator() {
    _secondOperand = double.parse(_displayedValue);
    _displayedValue = "0";
  }

  /// Sets the current operator.
  void setCurrentOperator(Operator newOperator) {
    setState(() {
      if (_operationEnded) {
        _operationEnded = false;
        _displayedValue = "0";
        _secondOperand = double.minPositive;

        _firstOperand = _currentOperation.compute().toDouble();

        _currentOperator = Operator.none;

        _currentOperation = _currentOperation.copyWith(
            firstOperand: _firstOperand,
            secondOperand: _secondOperand,
            calculatorOperator: _currentOperator,
            operationEnded: _operationEnded);
      } else {
        if (_currentOperation.calculatorOperator != Operator.none &&
            _firstOperand != 0.0) {
          _currentOperator = newOperator;

          _currentOperation =
              _currentOperation.copyWith(calculatorOperator: _currentOperator);

          return;
        }
      }
      if (_currentOperator == Operator.none) {
        _currentOperator = newOperator;
        _currentOperation =
            _currentOperation.copyWith(calculatorOperator: _currentOperator);
      } else {
        _firstOperand = _currentOperation.compute().toDouble();
        _currentOperator = newOperator;
        _currentOperation =
            _currentOperation.copyWith(calculatorOperator: _currentOperator);

        _secondOperand = double.minPositive;
      }
    });
  }

  /// Ends the current operation.
  void endOperation() {
    setState(() {
      try {
        _displayedValue = _currentOperation.compute().toString();
      } on Exception catch (e) {
        // TODO: Implement user feedback for invalid operations
      }

      _operationEnded = true;
    });
  }

  /// Clears the current entry.
  void clearEntry() {
    setState(() {
      if (!(_currentOperation.isComplete && _currentOperation.operationEnded)) {
        _displayedValue = "0";
      } else {
        clear();
      }
    });
  }

  /// Performs a backspace operation.
  void backspace() {
    setState(() {
      if (_displayedValue != "") {
        _displayedValue =
            _displayedValue.substring(0, _displayedValue.length - 1);

        if (_displayedValue == "") _displayedValue = "0";

        if ((_currentOperation.calculatorOperator != Operator.none) ||
            (_currentOperation.calculatorOperator != null)) {
          _secondOperand = double.parse(_displayedValue);
        } else {
          _firstOperand = double.parse(_displayedValue);
        }

        _currentOperation = _currentOperation.copyWith(
            firstOperand: _firstOperand,
            secondOperand: _secondOperand,
            calculatorOperator: _currentOperator);
      }
    });
  }

  /// Changes the sign of the displayed value.
  void plusMinus() {
    setState(() {
      if (_displayedValue != "0") {
        if (_displayedValue[0] == "-") {
          _displayedValue = _displayedValue.substring(1);
        } else {
          _displayedValue = "-" + _displayedValue;
        }
      }

      if (_currentOperation.calculatorOperator != Operator.none) {
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

  /// Sets the decimal point.
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

  /// Clears all values and resets the calculator.
  void clear() {
    setState(() {
      _displayedValue = "0";
      _firstOperand = double.minPositive;
      _secondOperand = double.minPositive;
      _currentOperator = Operator.none;
      _currentOperation.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CalculatorScreen(
      title: widget.title,
      calculator: Calculator(),
    );
  }
}
