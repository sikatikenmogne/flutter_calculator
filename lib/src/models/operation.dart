import 'operator.dart';

/// Represents a mathematical operation.
class Operation {
  double firstOperand;
  double secondOperand;
  Operator? calculatorOperator;
  bool operationEnded;

  /// Constructs an instance of [Operation].
  Operation({
    this.firstOperand = 0,
    this.secondOperand = 0,
    this.calculatorOperator,
    this.operationEnded = false,
  });

  /// Returns a string representation of the operation.
  ///
  /// If the [calculatorOperator] is not [Operator.none] and not null, it will
  /// render the operation as a binary or unary operation based on the
  /// [isBinaryOperation] property. Otherwise, it will format the [firstOperand]
  /// as a number.
  @override
  String toString() {
    return ((calculatorOperator != Operator.none) &&
            (calculatorOperator != null))
        ? isBinaryOperation
            ? _renderBinaryOperation(
                firstOperand, secondOperand, calculatorOperator, operationEnded)
            : _renderUnaryOperation(
                firstOperand, calculatorOperator, operationEnded)
        : _formatNumber(firstOperand);
  }

  /// Returns whether the operation is a binary operation.
  bool get isBinaryOperation {
    return calculatorOperator != Operator.none && calculatorOperator != null
        ? calculatorOperator!.isBinaryOperator
        : false;
  }

  /// Returns whether the operation is complete.
  ///
  /// An operation is considered complete if the [calculatorOperator] is not
  /// [Operator.none] and the operands are set accordingly.
  bool get isComplete {
    if (calculatorOperator != Operator.none) {
      if (isBinaryOperation) {
        return (firstOperand != 0 && secondOperand != 0 && !operationEnded);
      } else {
        return (firstOperand != 0 && !operationEnded);
      }
    } else {
      return false;
    }
  }

  /// Computes the result of the operation.
  ///
  /// If the operation is a binary operation, it performs the operation using
  /// the [calculatorOperator] on the [firstOperand] and [secondOperand].
  /// Otherwise, it performs the operation using the [calculatorOperator] on
  /// the [firstOperand] and null.
  num compute() {
    return (isBinaryOperation)
        ? calculatorOperator!.operation(firstOperand, secondOperand)
        : calculatorOperator!.operation(firstOperand, null);
  }

  /// Formats a number as a string.
  ///
  /// If the number is an integer, it returns the integer value as a string.
  /// Otherwise, it returns the number as a string.
  String _formatNumber(double number) {
    if (number % 1 == 0) {
      return number.toInt().toString();
    } else {
      return number.toString();
    }
  }

  /// Renders a binary operation as a string.
  ///
  /// The string representation includes the [firstOperand], [calculatorOperator],
  /// [secondOperand], and [operationEnded] flag.
  String _renderBinaryOperation(double firstOperand, double secondOperand,
      Operator? calculatorOperator, bool operationEnded) {
    return "${_formatNumber(firstOperand)}${calculatorOperator != Operator.none ? " ${calculatorOperator}" : ""}${secondOperand != 0 && operationEnded ? " ${_formatNumber(secondOperand)}" : ""}${operationEnded ? " =" : ""}";
  }

  /// Renders a unary operation as a string.
  ///
  /// The string representation includes the [uniqueOperand], [calculatorOperator],
  /// and [operationEnded] flag.
  String _renderUnaryOperation(
      double uniqueOperand, Operator? calculatorOperator, bool operationEnded) {
    return "${calculatorOperator}(${_formatNumber(uniqueOperand)})${operationEnded ? " =" : ""}";
  }

  /// Creates a copy of the [Operation] instance with the specified properties
  /// replaced with new values.
  Operation copyWith({
    double? firstOperand,
    double? secondOperand,
    Operator? calculatorOperator,
    bool? operationEnded,
  }) {
    return Operation(
      firstOperand: firstOperand ?? this.firstOperand,
      secondOperand: secondOperand ?? this.secondOperand,
      calculatorOperator: calculatorOperator ?? this.calculatorOperator,
      operationEnded: operationEnded ?? this.operationEnded,
    );
  }

  /// Clears the values of the given [currentOperation].
  ///
  /// Sets the first and second operands to 0, the calculator operator to none,
  /// and operationEnded to false.
  void clear() {
    firstOperand = 0;
    secondOperand = 0;
    calculatorOperator = Operator.none;
    operationEnded = false;
  }
}
