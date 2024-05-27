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
        : "$firstOperand";
  }

  const Operation(
      {this.firstOperand = 0.0,
      this.secondOperand = 0.0,
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
        return (firstOperand != 0.0 && secondOperand != 0.0 && !operationEnded);
      } else {
        return (firstOperand != 0.0 && !operationEnded);
      }
    } else {
      return false;
    }
  }

  String _renderBinaryOperation(double firstOperand, double secondOperand,
      CalculatorOperator calculatorOperator, bool operationEnded) {
    return "$firstOperand${calculatorOperator != CalculatorOperator.none ? " ${calculatorOperator.value}" : ""}${secondOperand != 0 && operationEnded ? " $secondOperand" : ""}${operationEnded ? " =" : ""}";
  }

  String _renderUnaryOperation(double uniqueOperand,
      CalculatorOperator calculatorOperator, bool operationEnded) {
    return "${calculatorOperator.value}($uniqueOperand)${operationEnded ? " =" : ""}";
  }
}
