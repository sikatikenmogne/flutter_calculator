import 'package:flutter_calculator/src/models/calculator_operator_enum.dart';

import 'operator.dart';

class Operation {
  final double firstOperand;
  final double secondOperand;
  final Operator? calculatorOperator;
  final bool operationEnded;

  @override
  String toString() {
    return ((calculatorOperator != Operator.none) && (calculatorOperator != null)) 
        ? isBinaryOperation
            ? _renderBinaryOperation(
                firstOperand, secondOperand, calculatorOperator, operationEnded)
            : _renderUnaryOperation(
                firstOperand, calculatorOperator, operationEnded)
        : _formatNumber(firstOperand);
  }

  const Operation(
      {this.firstOperand = 0,
      this.secondOperand = 0,
      this.calculatorOperator,
      this.operationEnded = false});

  bool get isBinaryOperation {
    return calculatorOperator != Operator.none
        ? <Operator>{
            Operator.add,
            Operator.subtract,
            Operator.multiply,
            Operator.divide,
            Operator.modulus,
            Operator.power,
          }.contains(calculatorOperator)
        : false;
  }

  bool get isComplete {
    if (calculatorOperator != Operator.none) {
      if (isBinaryOperation) {
        return (firstOperand != 0 && secondOperand != 0 && !operationEnded);
      } else {
        return (firstOperand != 0 && !operationEnded);
      }
    } else {
      return false;
    }
  }

  num compute() {
    return (isBinaryOperation)
        ? calculatorOperator!.operation(firstOperand, secondOperand)
        : calculatorOperator!.operation(firstOperand, null);
  }

  String _formatNumber(double number) {
    if (number % 1 == 0) {
      return number.toInt().toString();
    } else {
      return number.toString();
    }
  }

  String _renderBinaryOperation(double firstOperand, double secondOperand,
      Operator? calculatorOperator, bool operationEnded) {
    return "${_formatNumber(firstOperand)}${calculatorOperator != Operator.none ? " ${calculatorOperator}" : ""}${secondOperand != 0 && operationEnded ? " ${_formatNumber(secondOperand)}" : ""}${operationEnded ? " =" : ""}";
  }

  String _renderUnaryOperation(
      double uniqueOperand, Operator? calculatorOperator, bool operationEnded) {
    return "${calculatorOperator}(${_formatNumber(uniqueOperand)})${operationEnded ? " =" : ""}";
  }

  Operation copyWith({
    double? firstOperand,
    double? secondOperand,
    Operator? calculatorOperator,
    bool? operationEnded,
  }) {
    return Operation(
      firstOperand: firstOperand ?? this.firstOperand,
      secondOperand: secondOperand ?? this.secondOperand,
      calculatorOperator: calculatorOperator ?? this.calculatorOperator,
      operationEnded: operationEnded ?? this.operationEnded,
    );
  }
}
