import 'dart:math';

/// Represents an operator used in mathematical calculations.
class Operator {
  final String symbols;
  final num Function(num, num?) operation;
  final bool isUnary;

  /// Creates a new instance of the [Operator] class.
  ///
  /// The [symbols] parameter represents the symbol(s) used to represent the operator.
  /// The [operation] parameter is a function that performs the operation.
  /// The [isUnary] parameter indicates whether the operator is unary or binary.
  const Operator({
      required this.symbols,
      required this.operation,
      this.isUnary = true,
  });

  @override
  String toString() {
    return symbols;
  }

  /// Returns `true` if the operator is binary, `false` otherwise.
  bool get isBinaryOperator {
    return !isUnary;
  }

  /// Represents the addition operator.
  /// Adds two numbers: [firstOperand] and [secondOperand].
  ///
  /// Returns the sum of the two numbers as a [double].
  static Operator add = Operator(
    symbols: "+",
    isUnary: false,
    operation: (num firstOperand, num? secondOperand) {
      return firstOperand + secondOperand!;
    },
  );

  /// Represents the subtraction operator.
  /// Subtracts [secondOperand] from [firstOperand].
  ///
  /// Returns the difference between the two numbers as a [double].
  static Operator subtract = Operator(
    symbols: "-",
    isUnary: false,
    operation: (num firstOperand, num? secondOperand) {
      return firstOperand - secondOperand!;
    },
  );

  /// Represents the multiplication operator.
  /// Multiplies two numbers: [firstOperand] and [secondOperand].
  /// Returns the product of the two numbers as a [double].
  static Operator multiply = Operator(
    symbols: "*",
    isUnary: false,
    operation: (num firstOperand, num? secondOperand) {
      return firstOperand * secondOperand!;
    },
  );

  /// Represents the division operator.
  /// Divides [firstOperand] by [secondOperand].
  /// Returns the quotient of the two numbers as a [double].
  static Operator divide = Operator(
    symbols: "÷",
    isUnary: false,
    operation: (num firstOperand, num? secondOperand) {
      if (secondOperand != 0) {
        return firstOperand / secondOperand!;
      } else {
        throw ArgumentError('You cannot divide by zero');
      }
    },
  );

  /// Represents the square operator.
  /// Returns the square of the number [firstOperand].
  /// The second operand is not used.
  static Operator square = Operator(
    symbols: "sqr",
    operation: (num firstOperand, num? secondOperand) {
      return pow(firstOperand, 2);
    },
  );

  /// Represents the square root operator.
  /// Returns the square root of the number [firstOperand].
  static Operator squareRoot = Operator(
    symbols: "√",
    operation: (num firstOperand, num? secondOperand) {
      if (firstOperand < 0) throw Exception('Number must be non-negative');
      return sqrt(firstOperand);
    },
  );

  /// Represents the inverse operator.
  /// Returns the inverse of the number [firstOperand].
  /// Throws an [ArgumentError] if the number is zero.
  static Operator inverse = Operator(
    symbols: "1/",
    operation: (num firstOperand, num? secondOperand) {
      if (firstOperand != 0) {
        return 1 / firstOperand;
      } else {
        throw ArgumentError('You cannot divide by zero');
      }
    },
  );

  /// Represents the power operator.
  /// Returns the result of raising [firstOperand] to the power of [secondOperand].
  /// The second operand must be a non-negative integer.
  /// Returns the result of the power operation as a [num].
  static Operator power = Operator(
    symbols: "^",
    isUnary: false,
    operation: (num firstOperand, num? secondOperand) {
      return pow(firstOperand, secondOperand!);
    },
  );

  /// Represents the modulus operator.
  /// Returns the modulus of [firstOperand] divided by [secondOperand].
  /// The second operand must be a non-zero integer.
  /// Returns the modulus of the division as a [double].
  static Operator modulus = Operator(
    symbols: "%",
    isUnary: false,
    operation: (num firstOperand, num? secondOperand) {
      if (secondOperand == 0)
        throw Exception('The second operand should not be zero');

      num result = firstOperand.abs() % secondOperand!.abs();
      return (firstOperand < 0 || secondOperand < 0) && result > 0
          ? -result
          : result;
    },
  );

  /// Represents the factorial operator.
  /// Returns the factorial of the number [firstOperand].
  /// The number must be a non-negative integer.
  /// Returns the factorial of the number as a [num].
  static Operator factorial = Operator(
    symbols: "!",
    operation: (num firstOperand, num? secondOperand) {
      if (firstOperand < 0) {
        throw ArgumentError('Number must be non-negative');
      } else if (firstOperand == 0) {
        return 1;
      } else {
        return firstOperand * factorial.operation(firstOperand - 1, null);
      }
    },
  );

  /// Represents the logarithm operator.
  /// Returns the natural logarithm of the number [firstOperand].
  /// The number must be greater than zero.
  /// Returns the natural logarithm of the number as a [double].
  static Operator logarithm = Operator(
    symbols: "log",
    operation: (num firstOperand, num? secondOperand) {
      if (firstOperand <= 0)
        throw Exception('The number must be greater than zero');
      return log(firstOperand);
    },
  );

  /// Represents the tangent operator.
  /// Returns the tangent of the number [firstOperand].
  /// Returns the tangent of the number as a [double].
  static Operator tangent = Operator(
    symbols: "tan",
    operation: (num firstOperand, num? secondOperand) {
      return tan(firstOperand);
    },
  );

  /// Represents the cosine operator.
  /// Returns the cosine of the number [firstOperand].
  /// Returns the cosine of the number as a [double].
  /// The number must be in radians.
  static Operator cosine = Operator(
    symbols: "cos",
    operation: (num firstOperand, num? secondOperand) {
      return cos(firstOperand);
    },
  );

  /// Represents the absolute value operator.
  /// Returns the absolute value of the number [firstOperand].
  static Operator absolute = Operator(
    symbols: "|",
    operation: (num firstOperand, num? secondOperand) {
      return firstOperand.abs();
    },
  );

  /// Represents the exponential operator.
  /// Returns the value of the constant e raised to the power of [firstOperand].
  /// The second operand is not used.
  static Operator exponential = Operator(
    symbols: "e^",
    operation: (num firstOperand, num? secondOperand) {
      return exp(firstOperand);
    },
  );

  /// Represents the none operator.
  /// Returns the first operand.
  static Operator none = Operator(
    symbols: "",
    operation: (num firstOperand, num? secondOperand) {
      return firstOperand;
    },
  );

  /// A list of all available operators.
  static List<Operator> operators = [
    add,
    subtract,
    multiply,
    divide,
    square,
    squareRoot,
    inverse,
    power,
    modulus,
    factorial,
    logarithm,
    tangent,
    cosine,
    absolute,
    exponential,
    none,
  ];
}
