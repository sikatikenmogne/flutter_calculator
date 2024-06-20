import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_calculator/src/models/operation.dart';
import 'package:flutter_calculator/src/models/operator.dart';

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
  });
}
