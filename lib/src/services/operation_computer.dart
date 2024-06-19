import 'dart:math';
import 'dart:developer' as developer;
import 'package:flutter_calculator/src/models/operation.dart';

import '../models/calculator_operator_enum.dart';

/// A class that performs various mathematical operations.
class OperationComputer {
  /// Computes the result of the given [operation].
  ///
  /// The [operation] parameter is an instance of the [Operation] class,
  /// which contains the operands and the operator to be used for the computation.
  ///
  /// Returns the computed result as a [num].
  static num compute({required Operation operation}) {
    // switch (operation.calculatorOperator) {
    //   case CalculatorOperator.add:
    //     return add(operation.firstOperand, operation.secondOperand);
    //   case CalculatorOperator.subtract:
    //     return subtract(operation.firstOperand, operation.secondOperand);
    //   case CalculatorOperator.multiply:
    //     return multiply(operation.firstOperand, operation.secondOperand);
    //   case CalculatorOperator.divide:
    //     try {
    //       return divide(operation.firstOperand, operation.secondOperand);
    //     } catch (e) {
    //       print('An error occurred: $e');
    //       developer.log(
    //         'An error occured while computing the divide operation',
    //         name: 'OperationComputer.compute',
    //         error: e,
    //       );
    //       throw ArgumentError('$e');
    //     }
    //   case CalculatorOperator.square:
    //     return square(operation.firstOperand);
    //   case CalculatorOperator.squareRoot:
    //     try {
    //       return squareRoot(operation.firstOperand);
    //     } catch (e) {
    //       print('An error occurred: $e');
    //       developer.log(
    //         'An error occured while computing the square root operation',
    //         name: 'OperationComputer.compute',
    //         error: e,
    //       );
    //       throw Exception('$e');
    //     }
    //   case CalculatorOperator.inverse:
    //     return inverse(operation.firstOperand);
    //   case CalculatorOperator.power:
    //     return power(operation.firstOperand, operation.secondOperand);
    //   case CalculatorOperator.modulus:
    //     return modulus(operation.firstOperand, operation.secondOperand);
    //   case CalculatorOperator.factorial:
    //     return factorial(operation.firstOperand.toInt());
    //   case CalculatorOperator.logarithm:
    //     try {
    //       return logarithm(operation.firstOperand, operation.secondOperand);
    //     } catch (e) {
    //       print('An error occurred: $e');
    //       developer.log(
    //         'An error occured while computing the logarithm operation',
    //         name: 'OperationComputer.compute',
    //         error: e,
    //       );
    //       throw Exception('$e');
    //     }
    //   case CalculatorOperator.exponential:
    //     return exponential(operation.firstOperand, operation.secondOperand);
    //   case CalculatorOperator.absolute:
    //     return absolute(operation.firstOperand);
    //   case CalculatorOperator.none:
    //     return sine(operation.firstOperand);
    //   case CalculatorOperator.cosine:
    //     return cosine(operation.firstOperand);
    //   case CalculatorOperator.tangent:
    //     return tangent(operation.firstOperand);
    //   default:
    //     return operation.firstOperand;
    // }
    return operation.compute();
  }

  /// Resets the given [operation].
  ///
  /// The [operation] parameter is an instance of the [Operation] class
  /// that will be reset to its default values.
  static void reset(Operation operation) {
    operation = Operation();
  }

  /// Adds two numbers: [firstOperand] and [secondOperand].
  ///
  /// Returns the sum of the two numbers as a [double].
  static double add(double firstOperand, double secondOperand) {
    return firstOperand + secondOperand;
  }

  /// Subtracts [secondOperand] from [firstOperand].
  ///
  /// Returns the difference between the two numbers as a [double].
  static double subtract(double firstOperand, double secondOperand) {
    return firstOperand - secondOperand;
  }

  /// Multiplies two numbers: [firstOperand] and [secondOperand].
  ///
  /// Returns the product of the two numbers as a [double].
  static double multiply(double firstOperand, double secondOperand) {
    return firstOperand * secondOperand;
  }

  /// Divides [firstOperand] by [secondOperand].
  ///
  /// Throws an [ArgumentError] if [secondOperand] is zero.
  ///
  /// Returns the quotient of the division as a [double].
  static double divide(double firstOperand, double secondOperand) {
    if (secondOperand != 0) {
      return firstOperand / secondOperand;
    } else {
      throw ArgumentError('You cannot divide by zero.');
    }
  }

  /// Computes the square of the given [operand].
  ///
  /// Returns the square of the number as a [num].
  static num square(double operand) {
    return pow(operand, 2);
  }

  /// Computes the square root of the given [operand].
  ///
  /// Throws an [Exception] if the [operand] is negative.
  ///
  /// Returns the square root of the number as a [double].
  static double squareRoot(double operand) {
    if (operand < 0) throw Exception('Number must be non-negative.');
    return sqrt(operand);
  }

  /// Computes the inverse of the given [operand].
  ///
  /// Throws an [ArgumentError] if the [operand] is zero.
  ///
  /// Returns the inverse of the number as a [double].
  static double inverse(double operand) {
    if (operand != 0) {
      return 1 / operand;
    } else {
      throw ArgumentError('You cannot calculate the inverse of zero.');
    }
  }

  /// Computes the power of [base] raised to [exponent].
  ///
  /// Returns the result of the power operation as a [num].
  static num power(double base, double exponent) {
    return pow(base, exponent);
  }

  /// Computes the modulus of [firstOperand] divided by [secondOperand].
  ///
  /// Throws an [Exception] if [secondOperand] is zero.
  ///
  /// Returns the modulus of the division as a [double].
  static double modulus(double firstOperand, double secondOperand) {
    if (secondOperand == 0)
      throw Exception('The second operand should not be zero');
    double result = firstOperand.abs() % secondOperand.abs();
    return (firstOperand < 0 || secondOperand < 0) && result > 0
        ? -result
        : result;
  }

  /// Computes the factorial of the given [number].
  ///
  /// Throws an [ArgumentError] if the [number] is negative.
  ///
  /// Returns the factorial of the number as an [int].
  static int factorial(int number) {
    if (number < 0) throw ArgumentError('Number must be non-negative.');
    return number <= 1 ? 1 : number * factorial(number - 1);
  }

  /// Computes the logarithm of [firstOperand] with [secondOperand] as the base.
  ///
  /// Throws an [Exception] if [firstOperand] is less than or equal to zero,
  /// or if [secondOperand] is equal to one.
  ///
  /// Returns the result of the logarithm operation as a [double].
  static double logarithm(double firstOperand, double secondOperand) {
    if (firstOperand <= 0)
      throw Exception('The number must be greater than zero.');
    if (secondOperand == 1)
      throw Exception('The base of the logarithm cannot be one.');
    return log(firstOperand) / log(secondOperand);
  }

  /// Computes the exponential of [number] raised to [exponent].
  ///
  /// Returns the result of the exponential operation as a [num].
  static num exponential(double number, double exponent) {
    return pow(number, exponent);
  }

  /// Computes the absolute value of the given [number].
  ///
  /// Returns the absolute value of the number as a [double].
  static double absolute(double number) {
    return number.abs();
  }

  /// Computes the sine of the given [number].
  ///
  /// Returns the sine of the number as a [double].
  static double sine(double number) {
    return sin(number);
  }

  /// Computes the cosine of the given [number].
  ///
  /// Returns the cosine of the number as a [double].
  static double cosine(double number) {
    return cos(number);
  }

  /// Computes the tangent of the given [number].
  ///
  /// Returns the tangent of the number as a [double].
  static double tangent(double number) {
    return tan(number);
  }
}
