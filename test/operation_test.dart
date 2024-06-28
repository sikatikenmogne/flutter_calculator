import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_calculator/src/model/operation.dart';
import 'package:flutter_calculator/src/model/operator.dart';

void main() {
  group('Operation', () {
    test('Should render a binary operation correctly', () {
      final operation = Operation(
        firstOperand: 5.0,
        secondOperand: 3.0,
        calculatorOperator: Operator.add,
        operationEnded: true,
      );

      final result = operation.toString();

      expect(result, equals('5 + 3 ='));
    });

    test('Should render a unary operation correctly', () {
      final operation = Operation(
        firstOperand: 5.0,
        calculatorOperator: Operator.squareRoot,
        operationEnded: true,
      );

      final result = operation.toString();

      expect(result, equals('√(5) ='));
    });

    test('Should render a number correctly', () {
      final operation = Operation(firstOperand: 5.0);

      final result = operation.toString();

      expect(result, equals('5'));
    });

    test('Should compute a binary operation correctly', () {
      final operation = Operation(
        firstOperand: 5.0,
        secondOperand: 3.0,
        calculatorOperator: Operator.multiply,
        operationEnded: true,
      );

      final result = operation.compute();

      expect(result, equals(15.0));
    });

    test('Should compute a unary operation correctly', () {
      final operation = Operation(
        firstOperand: 9.0,
        calculatorOperator: Operator.square,
        operationEnded: true,
      );

      final result = operation.compute();

      expect(result, equals(81.0));
    });

    test('Should copy an operation correctly', () {
      final originalOperation = Operation(
        firstOperand: 5.0,
        secondOperand: 3.0,
        calculatorOperator: Operator.add,
        operationEnded: true,
      );

      final copiedOperation = originalOperation.copyWith(
        firstOperand: 10.0,
        operationEnded: false,
      );

      expect(copiedOperation.firstOperand, equals(10.0));
      expect(copiedOperation.secondOperand, equals(3.0));
      expect(copiedOperation.calculatorOperator, equals(Operator.add));
      expect(copiedOperation.operationEnded, equals(false));
    });

    test('Should clear an operation correctly', () {
      Operation operation = Operation(
        firstOperand: 5.0,
        secondOperand: 3.0,
        calculatorOperator: Operator.add,
        operationEnded: true,
      );

      operation.clear();

      Operation clearedOperation = operation;

      expect(clearedOperation.firstOperand, equals(double.minPositive));
      expect(clearedOperation.secondOperand, equals(double.minPositive));
      expect(clearedOperation.calculatorOperator, equals(Operator.none));
      expect(clearedOperation.operationEnded, equals(false));
    });

    test('Should compute the operation correctly', () {
      final operation = Operation(
        firstOperand: 5.0,
        secondOperand: 3.0,
        calculatorOperator: Operator.add,
        operationEnded: true,
      );

      final updatedOperation = operation.compute();

      expect(updatedOperation, equals(8.0));
      expect(operation.firstOperand, equals(5.0));
      expect(operation.secondOperand, equals(3.0));
      expect(operation.calculatorOperator, equals(Operator.add));
      expect(operation.operationEnded, equals(true));
    });

    test('Should compute the operation correctly when the operation is unary',
        () {
      final operation = Operation(
        firstOperand: 9.0,
        calculatorOperator: Operator.square,
        operationEnded: true,
      );

      final updatedOperation = operation.compute();

      expect(updatedOperation, equals(81.0));
      expect(operation.firstOperand, equals(9.0));
      expect(operation.calculatorOperator, equals(Operator.square));
      expect(operation.operationEnded, equals(true));
    });

    test(
        'Should compute the operation correctly when the operation is unary and the first operand is zero',
        () {
      final operation = Operation(
        firstOperand: 0.0,
        calculatorOperator: Operator.square,
        operationEnded: true,
      );

      final updatedOperation = operation.compute();

      expect(updatedOperation, equals(0.0));
      expect(operation.firstOperand, equals(0.0));
      expect(operation.calculatorOperator, equals(Operator.square));
      expect(operation.operationEnded, equals(true));
    });

    test(
        'Should compute the operation correctly when the operation is unary and the first operand is decimal',
        () {
      final operation = Operation(
        firstOperand: 5.0,
        calculatorOperator: Operator.square,
        operationEnded: true,
      );

      final updatedOperation = operation.compute();

      expect(updatedOperation, equals(25.0));
      expect(operation.calculatorOperator, equals(Operator.square));
      expect(operation.operationEnded, equals(true));
    });

    test(
        'Should compute the operation correctly when the operation is unary and the operation has ended',
        () {
      final operation = Operation(
        firstOperand: 9.0,
        calculatorOperator: Operator.square,
        operationEnded: true,
      );

      final updatedOperation = operation.compute();

      expect(updatedOperation, equals(81.0));
      expect(operation.calculatorOperator, equals(Operator.square));
      expect(operation.operationEnded, equals(true));
    });
  });
}
