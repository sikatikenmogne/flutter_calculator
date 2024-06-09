import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_calculator/src/services/operation_computer.dart';
import 'package:flutter_calculator/src/models/operation.dart';
import 'package:flutter_calculator/src/models/calculator_operator_enum.dart';

void main() {
  group('OperationComputer', () {
    test('add', () {
      expect(OperationComputer.add(2, 3), 5);
      expect(OperationComputer.add(-2, 3), 1);
      expect(OperationComputer.add(0, 0), 0);
    });

    test('subtract', () {
      expect(OperationComputer.subtract(5, 3), 2);
      expect(OperationComputer.subtract(-2, 3), -5);
      expect(OperationComputer.subtract(0, 0), 0);
    });

    test('multiply', () {
      expect(OperationComputer.multiply(2, 3), 6);
      expect(OperationComputer.multiply(-2, 3), -6);
      expect(OperationComputer.multiply(0, 3), 0);
    });

    test('divide', () {
      expect(OperationComputer.divide(6, 3), 2);
      expect(OperationComputer.divide(-6, 3), -2);
      expect(() => OperationComputer.divide(6, 0), throwsArgumentError);
    });

    test('square', () {
      expect(OperationComputer.square(2), 4);
      expect(OperationComputer.square(-2), 4);
      expect(OperationComputer.square(0), 0);
    });

    test('squareRoot', () {
      expect(OperationComputer.squareRoot(4), 2);
      expect(() => OperationComputer.squareRoot(-1), throwsException);
    });

    test('inverse', () {
      expect(OperationComputer.inverse(2), 0.5);
      expect(() => OperationComputer.inverse(0), throwsArgumentError);
    });

    test('power', () {
      expect(OperationComputer.power(2, 3), 8);
      expect(OperationComputer.power(-2, 3), -8);
      expect(OperationComputer.power(2, 0), 1);
    });

    test('modulus', () {
      expect(OperationComputer.modulus(10, 3), 1);
      expect(OperationComputer.modulus(-10, 3), -1);
      expect(OperationComputer.modulus(10, -3), -1);
      expect(() => OperationComputer.modulus(10, 0), throwsException);
    });

    test('factorial', () {
      expect(OperationComputer.factorial(5), 120);
      expect(OperationComputer.factorial(0), 1);
      expect(() => OperationComputer.factorial(-1), throwsArgumentError);
    });

    // test('logarithm', () {
    //   expect(OperationComputer.logarithm(8, 2), 3);
    //   expect(() => OperationComputer.logarithm(-1, 2), throwsException);
    //   expect(() => OperationComputer.logarithm(8, 1), throwsException);
    // });

    test('exponential', () {
      expect(OperationComputer.exponential(2, 3), 8);
      expect(OperationComputer.exponential(-2, 3), -8);
      expect(OperationComputer.exponential(2, 0), 1);
    });

    test('absolute', () {
      expect(OperationComputer.absolute(2), 2);
      expect(OperationComputer.absolute(-2), 2);
      expect(OperationComputer.absolute(0), 0);
    });

    test('sine', () {
      expect(OperationComputer.sine(0), 0);
    });

    test('cosine', () {
      expect(OperationComputer.cosine(0), 1);
    });

    test('tangent', () {
      expect(OperationComputer.tangent(0), 0);
    });

    test('compute', () {
      expect(OperationComputer.compute(operation: Operation(firstOperand: 2, secondOperand: 3, calculatorOperator: CalculatorOperator.add)), 5);
      expect(OperationComputer.compute(operation: Operation(firstOperand: 2, secondOperand: 3, calculatorOperator: CalculatorOperator.subtract)), -1);
      expect(OperationComputer.compute(operation: Operation(firstOperand: 2, secondOperand: 3, calculatorOperator: CalculatorOperator.multiply)), 6);
      expect(() => OperationComputer.compute(operation: Operation(firstOperand: 2, secondOperand: 0, calculatorOperator: CalculatorOperator.divide)), throwsArgumentError);
    });
  });
}