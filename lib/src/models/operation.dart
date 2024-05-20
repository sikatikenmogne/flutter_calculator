import 'package:flutter_calculator/src/models/calculator_operator_enum.dart';

class Operation {
  double firstOperand = 0.0;
  double secondOperand = 0.0;
  CalculatorOperator calculatorOperator = CalculatorOperator.none;
  bool operationEnded = false;

  @override
  String toString() {
    return calculatorOperator != CalculatorOperator.none
        ? "$firstOperand ${calculatorOperator.value} ${secondOperand != 0 ? "$secondOperand" : ""}${operationEnded ? " =" : ""}"
        : "$firstOperand";
  }

  Operation(
      {this.firstOperand = 0.0,
      this.secondOperand = 0.0,
      this.calculatorOperator = CalculatorOperator.none});
}
