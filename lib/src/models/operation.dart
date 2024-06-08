import 'package:flutter_calculator/src/models/calculator_operator_enum.dart';

class Operation {
  final double firstOperand;
  final double secondOperand;
  final CalculatorOperator calculatorOperator;
  final bool operationEnded;

  @override
  String toString() {
    return calculatorOperator != CalculatorOperator.none
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
      this.calculatorOperator = CalculatorOperator.none,
      this.operationEnded = false});

  bool get isBinaryOperation {
    return calculatorOperator != CalculatorOperator.none
        ? <CalculatorOperator>{
            CalculatorOperator.add,
            CalculatorOperator.subtract,
            CalculatorOperator.multiply,
            CalculatorOperator.divide,
            CalculatorOperator.modulus,
            CalculatorOperator.power,
          }.contains(calculatorOperator)
        : false;
  }

  bool get isComplete {
    if (calculatorOperator != CalculatorOperator.none) {
      if (isBinaryOperation) {
        return (firstOperand != 0 && secondOperand != 0 && !operationEnded);
      } else {
        return (firstOperand != 0 && !operationEnded);
      }
    } else {
      return false;
    }
  }

  String _formatNumber(double number) {
    if (number % 1 == 0) {
      return number.toInt().toString();
    } else {
      return number.toString();
    }
  }

  String _renderBinaryOperation(double firstOperand, double secondOperand,
      CalculatorOperator calculatorOperator, bool operationEnded) {
    return "${_formatNumber(firstOperand)}${calculatorOperator != CalculatorOperator.none ? " ${calculatorOperator.value}" : ""}${secondOperand != 0 && operationEnded ? " ${_formatNumber(secondOperand)}" : ""}${operationEnded ? " =" : ""}";
  }

  String _renderUnaryOperation(double uniqueOperand,
      CalculatorOperator calculatorOperator, bool operationEnded) {
    return "${calculatorOperator.value}(${_formatNumber(uniqueOperand)})${operationEnded ? " =" : ""}";
  }
}
