import 'dart:math';

import 'package:flutter_calculator/src/model/operation.dart';
import 'package:flutter_calculator/src/model/operator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Operator", () {
    test('Addition operator should return the correct result', () {
      final operator = Operator.add;
      final result = operator.operation(5, 3);
      expect(result, equals(8));
    });

    test('Subtraction operator should return the correct result', () {
      final operator = Operator.subtract;
      final result = operator.operation(5, 3);
      expect(result, equals(2));
    });

    test('Multiplication operator should return the correct result', () {
      final operator = Operator.multiply;
      final result = operator.operation(5, 3);
      expect(result, equals(15));
    });

    test('Division operator should return the correct result', () {
      final operator = Operator.divide;
      final result = operator.operation(6, 3);
      expect(result, equals(2));
    });

    test('modulus', () {
      expect(
          Operation(
                  firstOperand: 10,
                  secondOperand: 3,
                  calculatorOperator: Operator.modulus)
              .compute(),
          1);
      expect(
          Operation(
                  firstOperand: -10,
                  secondOperand: 3,
                  calculatorOperator: Operator.modulus)
              .compute(),
          -1);
      expect(
          Operation(
                  firstOperand: 10,
                  secondOperand: -3,
                  calculatorOperator: Operator.modulus)
              .compute(),
          -1);
      expect(
          () => Operation(
                  firstOperand: 10,
                  secondOperand: 0,
                  calculatorOperator: Operator.modulus)
              .compute(),
          throwsException);
    });

    test('factorial', () {
      expect(
          Operation(firstOperand: 5, calculatorOperator: Operator.factorial)
              .compute(),
          120);
      expect(
          Operation(firstOperand: 0, calculatorOperator: Operator.factorial)
              .compute(),
          1);
      expect(
          () => Operation(
                  firstOperand: -1, calculatorOperator: Operator.factorial)
              .compute(),
          throwsArgumentError);
    });

    test('Square operator should return the correct result', () {
      final operator = Operator.square;
      final result = operator.operation(5, null);
      expect(result, equals(25));
    });

    test(
        'Square root operator should return the correct result and throw exceptions for invalid input',
        () {
      final operator = Operator.squareRoot;

      // Test with valid input
      final result = operator.operation(25, null);
      expect(result, equals(5));

      // Test with negative number
      expect(() => operator.operation(-1, null), throwsA(isA<Exception>()));
    });
    test('Inverse operator should return the correct result', () {
      final operator = Operator.inverse;
      final result = operator.operation(5, null);
      expect(result, equals(0.2));
    });

    test('Power operator should return the correct result', () {
      final operator = Operator.power;
      final result = operator.operation(2, 3);
      expect(result, equals(8));
    });

    test('Tangent operator should return the correct result', () {
      final operator = Operator.tangent;
      final result = operator.operation(0, null);
      expect(result, equals(0));
    });

    test('Cosine operator should return the correct result', () {
      final operator = Operator.cosine;
      final result = operator.operation(0, null);
      expect(result, equals(1));
    });

    test('Absolute operator should return the correct result', () {
      final operator = Operator.absolute;
      final result = operator.operation(-5, null);
      expect(result, equals(5));
    });

    test('Exponential operator should return the correct result', () {
      final operator = Operator.exponential;
      final result = operator.operation(2, null);
      expect(result, closeTo(exp(2), 0.0001));
    });

    test('logarithm', () {
      var logOperator = Operator.logarithm;

      // Test with valid input
      expect(logOperator.operation(10, null), closeTo(log(10), 0.0001));

      // Test with zero
      expect(() => logOperator.operation(0, null), throwsA(isA<Exception>()));

      // Test with negative number
      expect(() => logOperator.operation(-1, null), throwsA(isA<Exception>()));
    });
  });
}
