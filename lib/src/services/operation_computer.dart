import 'dart:math';

import 'package:flutter_calculator/src/models/operation.dart';

import '../models/calculator_operator_enum.dart';

class OperationComputer {
  static num compute({required Operation operation}) {
    switch (operation.calculatorOperator) {
      case CalculatorOperator.add:
        return add(operation.firstOperand, operation.secondOperand);
      case CalculatorOperator.subtract:
        return subtract(operation.firstOperand, operation.secondOperand);
      case CalculatorOperator.multiply:
        return multiply(operation.firstOperand, operation.secondOperand);
      case CalculatorOperator.divide:
        return divide(operation.firstOperand, operation.secondOperand);
      case CalculatorOperator.square:
        return square(operation.firstOperand);
      case CalculatorOperator.squareRoot:
        return squareRoot(operation.firstOperand);
      case CalculatorOperator.inverse:
        return inverse(operation.firstOperand);
      case CalculatorOperator.power:
        return power(operation.firstOperand, operation.secondOperand);
      case CalculatorOperator.modulus:
        return modulus(operation.firstOperand, operation.secondOperand);
      case CalculatorOperator.factorial:
        return factorial(operation.firstOperand.toInt());
      case CalculatorOperator.logarithm:
        return logarithm(operation.firstOperand, operation.secondOperand);
      case CalculatorOperator.exponential:
        return exponential(operation.firstOperand, operation.secondOperand);
      case CalculatorOperator.absolute:
        return absolute(operation.firstOperand);
      case CalculatorOperator.none:
        return sine(operation.firstOperand);
      case CalculatorOperator.cosine:
        return cosine(operation.firstOperand);
      case CalculatorOperator.tangent:
        return tangent(operation.firstOperand);
      default:
        return operation.firstOperand;
    }
  } //

  static void reset(Operation operation) {
    operation = Operation();
  }

  static double add(double firstOperand, double secondOperand) {
    return firstOperand + secondOperand;
  }

  static double subtract(double firstOperand, double secondOperand) {
    return firstOperand - secondOperand;
  }

  static double multiply(double firstOperand, double secondOperand) {
    return firstOperand * secondOperand;
  }

  static double divide(double firstOperand, double secondOperand) {
    if (secondOperand != 0) {
      return firstOperand / secondOperand;
    } else {
      throw ArgumentError('You cannot divide by zero.');
    }
  }

  static num square(double operand) {
    return pow(operand, 2);
  }

  static double squareRoot(double operand) {
    return sqrt(operand);
  }

  static double inverse(double operand) {
    if (operand != 0) {
      return 1 / operand;
    } else {
      throw ArgumentError('You cannot calculate the inverse of zero.');
    }
  }

  static num power(double base, double exponent) {
    return pow(base, exponent);
  }

  static double modulus(double firstOperand, double secondOperand) {
    return firstOperand % secondOperand;
  }

  static int factorial(int number) {
    if (number < 0) throw ArgumentError('Number must be non-negative.');
    return number <= 1 ? 1 : number * factorial(number - 1);
  }

  static double logarithm(double number, double base) {
    return log(number) / log(base);
  }

  static num exponential(double number, double exponent) {
    return pow(number, exponent);
  }

  static double absolute(double number) {
    return number.abs();
  }

  static double sine(double number) {
    return sin(number);
  }

  static double cosine(double number) {
    return cos(number);
  }

  static double tangent(double number) {
    return tan(number);
  }
}
