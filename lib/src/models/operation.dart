import 'package:flutter_calculator/src/models/calculator_operator_enum.dart';

class Operation {
  double _firstOperand = 0.0;
  double _secondOperand = 0.0;
  CalculatorOperator _calculatorOperator = CalculatorOperator.NONE;
  bool _operationEnded = false;
  double get firstOperand => _firstOperand;

  bool get operationEnded => _operationEnded;

  set operationEnded(bool value) {
    _operationEnded = value;
  }

  @override
  String toString() {
    return calculatorOperator != CalculatorOperator.NONE
        ? "$firstOperand ${calculatorOperator.value} ${secondOperand != 0 ? "$secondOperand" : ""}${operationEnded ? " =" : ""}"
        : "$firstOperand";
  }

  set firstOperand(double value) {
    _firstOperand = value;
  }

  Operation(
      {firstOperand = 0.0,
      secondOperand = 0.0,
      calculatorOperator = CalculatorOperator.NONE}) {
    _firstOperand = firstOperand;
    _secondOperand = secondOperand;
    _calculatorOperator = calculatorOperator;
  }

  double get secondOperand => _secondOperand;

  set secondOperand(double value) {
    _secondOperand = value;
  }

  CalculatorOperator get calculatorOperator => _calculatorOperator;

  set calculatorOperator(CalculatorOperator value) {
    _calculatorOperator = value;
  }
}
