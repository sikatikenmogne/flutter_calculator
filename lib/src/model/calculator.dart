import 'package:flutter_calculator/src/model/operation.dart';
import 'package:flutter_calculator/src/model/operator.dart';

class Calculator {
  String _displayedValue = "0";

  Operation _currentOperation = Operation();

  /// Adds a digit to the displayed value and updates the current operation.
  ///
  /// The [value] parameter represents the digit to be added.
  /// This method is called when a digit button is pressed in the calculator UI.
  void addDigit(String value) {
    if (_currentOperation.operationEnded) {
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
      _currentOperation = _currentOperation.copyWith(
          firstOperand: double.parse(_displayedValue));
    } else if (!_currentOperation.secondOperandIsDefined) {
      _currentOperation = _currentOperation.copyWith(
          secondOperand: double.parse(_displayedValue));
    } else {
      _currentOperation.clear();
      _currentOperation = _currentOperation.copyWith(
          firstOperand: double.parse(_displayedValue),
          calculatorOperator: Operator.none);
    }

    if (_currentOperation.operationEnded) {
      _currentOperation.operationEnded = false;
    }
  }

  /// Sets the current operator.
  void setCurrentOperator(Operator newOperator) {
    if (_currentOperation.operationEnded) {
      _displayedValue = "0";

      _currentOperation.firstOperand = _currentOperation.compute().toDouble();

      _currentOperation = _currentOperation.copyWith(
          firstOperand: _currentOperation.compute().toDouble(),
          secondOperand: double.minPositive,
          calculatorOperator: Operator.none,
          operationEnded: false);
    } else {
      if (_currentOperation.calculatorOperator != Operator.none &&
          _currentOperation.firstOperand != 0.0) {
        _currentOperation =
            _currentOperation.copyWith(calculatorOperator: newOperator);

        return;
      }
    }
    if (_currentOperation.calculatorOperator == Operator.none) {
      _currentOperation =
          _currentOperation.copyWith(calculatorOperator: newOperator);
    } else {
      _currentOperation.firstOperand = _currentOperation.compute().toDouble();
      _currentOperation =
          _currentOperation.copyWith(calculatorOperator: newOperator);

      _currentOperation.secondOperand = double.minPositive;
    }
  }

  /// Ends the current operation.
  void endOperation() {
    try {
      _displayedValue = _currentOperation.compute().toString();
    } on Exception catch (e) {
      // TODO: Implement user feedback for invalid operations
    }

    _currentOperation.operationEnded = true;
  }

  /// Clears the current entry.
  void clearEntry() {
    if (!(_currentOperation.isComplete && _currentOperation.operationEnded)) {
      _displayedValue = "0";
    } else {
      clear();
    }
  }

  /// Performs a backspace operation.
  void backspace() {
    double firstOperand = 0.0;
    double secondOperand = 0.0;

    if (_displayedValue != "") {
      _displayedValue =
          _displayedValue.substring(0, _displayedValue.length - 1);

      if (_displayedValue == "") _displayedValue = "0";

      if ((_currentOperation.calculatorOperator != Operator.none) ||
          (_currentOperation.calculatorOperator != null)) {
        secondOperand = double.parse(_displayedValue);
      } else {
        firstOperand = double.parse(_displayedValue);
      }

      _currentOperation = _currentOperation.copyWith(
          firstOperand: firstOperand, secondOperand: secondOperand);
    }
  }

  /// Changes the sign of the displayed value.
  void plusMinus() {
    double firstOperand = 0.0;
    double secondOperand = 0.0;

    if (_displayedValue != "0") {
      if (_displayedValue[0] == "-") {
        _displayedValue = _displayedValue.substring(1);
      } else {
        _displayedValue = "-" + _displayedValue;
      }
    }

    if (_currentOperation.calculatorOperator != Operator.none) {
      secondOperand = double.parse(_displayedValue);
    } else {
      firstOperand = double.parse(_displayedValue);
    }

    _currentOperation = _currentOperation.copyWith(
        firstOperand: firstOperand, secondOperand: secondOperand);
  }

  /// Sets the decimal point.
  void setDecimal() {
    if (_displayedValue != "0") {
      if (!_displayedValue.contains('.') && !_currentOperation.operationEnded) {
        _displayedValue = "$_displayedValue.";
      }
    }
  }

  /// Clears all values and resets the calculator.
  void clear() {
    _displayedValue = "0";
    _currentOperation.clear();
  }
}
