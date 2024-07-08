import 'package:flutter/material.dart';
import 'package:flutter_calculator/src/model/operation.dart';
import 'package:flutter_calculator/src/model/operator.dart';

class Calculator extends ChangeNotifier {
  String displayedValue = "0";
  Operation currentOperation = Operation();

  /// Adds a digit to the displayed value and updates the current operation.
  ///
  /// The [value] parameter represents the digit to be added.
  /// This method is called when a digit button is pressed in the calculator UI.
  void addDigit(String value) {
    if (currentOperation.operationEnded) {
      clearEntry();
    }

    // Update displayed value
    if (displayedValue == "0") {
      displayedValue = value;
    } else {
      if (!currentOperation.secondOperandIsDefined) {
        if (currentOperation.firstOperandIsDefined) {
          if (currentOperation.secondOperand != double.minPositive) {
            displayedValue = displayedValue + value;
          } else {
            displayedValue = value;
          }
        } else {
          displayedValue = displayedValue + value;
        }
      } else {
        displayedValue += value;
      }
    }

    if (!currentOperation.firstOperandIsDefined) {
      currentOperation =
          currentOperation.copyWith(firstOperand: double.parse(displayedValue));
    } else if (!currentOperation.secondOperandIsDefined) {
      currentOperation = currentOperation.copyWith(
          secondOperand: double.parse(displayedValue));
    } else {
      currentOperation.clear();
      currentOperation = currentOperation.copyWith(
          firstOperand: double.parse(displayedValue),
          calculatorOperator: Operator.none);
    }

    if (currentOperation.operationEnded) {
      currentOperation.operationEnded = false;
    }

    notifyListeners();
  }

  /// Sets the current operator.
  void setCurrentOperator(Operator newOperator) {
    if (currentOperation.operationEnded) {
      displayedValue = "0";

      currentOperation = currentOperation.copyWith(
          firstOperand: currentOperation.compute().toDouble(),
          secondOperand: double.minPositive,
          calculatorOperator: Operator.none,
          operationEnded: false);
    } else {
      if (currentOperation.calculatorOperator != Operator.none &&
          currentOperation.firstOperand != 0.0) {
        currentOperation =
            currentOperation.copyWith(calculatorOperator: newOperator);

        if (currentOperation.calculatorOperator!.isUnary) {
          endOperation();
        }

        notifyListeners();

        return;
      }
    }
    if (currentOperation.calculatorOperator == Operator.none) {
      currentOperation =
          currentOperation.copyWith(calculatorOperator: newOperator);

      if (currentOperation.calculatorOperator!.isUnary) {
        endOperation();
      }

    } else {
      currentOperation.firstOperand = currentOperation.compute().toDouble();
      currentOperation =
          currentOperation.copyWith(calculatorOperator: newOperator);

      currentOperation.secondOperand = double.minPositive;
    }

    notifyListeners();
  }

  /// Ends the current operation.
  void endOperation() {
    try {
      displayedValue = currentOperation.compute().toString();
    } catch (e) {
      displayedValue = e
          .toString()
          .replaceAll('Exception: ', '')
          .replaceAll('Invalid argument(s): ', '');
    }

    currentOperation.operationEnded = true;

    notifyListeners();
  }

  /// Clears the current entry.
  void clearEntry() {
    if (!(currentOperation.isComplete && currentOperation.operationEnded)) {
      displayedValue = "0";
    } else {
      clear();
    }

    notifyListeners();
  }

  /// Performs a backspace operation.
  void backspace() {
    double firstOperand = 0.0;
    double secondOperand = 0.0;

    if (displayedValue != "") {
      displayedValue = displayedValue.substring(0, displayedValue.length - 1);

      if (displayedValue == "") displayedValue = "0";

      if (!currentOperation.firstOperandIsDefined ||
          !currentOperation.operatorIsDefined) {
        firstOperand = double.parse(displayedValue);

        currentOperation =
            currentOperation.copyWith(firstOperand: firstOperand);
      } else {
        secondOperand = double.parse(displayedValue);
        currentOperation =
            currentOperation.copyWith(secondOperand: secondOperand);
      }
    }

    notifyListeners();
  }

  /// Changes the sign of the displayed value.
  void plusMinus() {
    double firstOperand = 0.0;
    double secondOperand = 0.0;

    if (displayedValue != "0") {
      if (displayedValue[0] == "-") {
        displayedValue = displayedValue.substring(1);
      } else {
        displayedValue = "-" + displayedValue;
      }
    }

    if (!currentOperation.firstOperandIsDefined ||
        !currentOperation.operatorIsDefined) {
      firstOperand = double.parse(displayedValue);

      currentOperation = currentOperation.copyWith(firstOperand: firstOperand);
    } else {
      secondOperand = double.parse(displayedValue);
      currentOperation =
          currentOperation.copyWith(secondOperand: secondOperand);
    }

    notifyListeners();
  }

  /// Sets the decimal point.
  void setDecimal() {
    if (!displayedValue.contains('.') && !currentOperation.operationEnded) {
      displayedValue = "$displayedValue.";
    }

    notifyListeners();
  }

  /// Clears all values and resets the calculator.
  void clear() {
    displayedValue = "0";
    currentOperation.clear();

    notifyListeners();
  }
}
