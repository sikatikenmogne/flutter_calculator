import 'dart:math';

class Operator {
  String symbols;
  num Function(num, num?) operation;
  bool? isUnary;

  Operator(
      {required this.symbols, required this.operation, bool isUnary = true}) {
    isUnary = isUnary;
  }

  @override
  String toString() {
    return symbols;
  }

  bool get isBinaryOperator {
    return !isUnary!;
  }

  static Operator add = Operator(
      symbols: "+",
      isUnary: false,
      operation: (num firstOperand, num? secondOperand) {
        return firstOperand + secondOperand!;
      });

  static Operator subtract = Operator(
      symbols: "-",
      isUnary: false,
      operation: (num firstOperand, num? secondOperand) {
        return firstOperand - secondOperand!;
      });

  static Operator multiply = Operator(
      symbols: "*",
      isUnary: false,
      operation: (num firstOperand, num? secondOperand) {
        return firstOperand * secondOperand!;
      });

  static Operator divide = Operator(
      symbols: "÷",
      isUnary: false,
      operation: (num firstOperand, num? secondOperand) {
        if (secondOperand != 0) {
          return firstOperand / secondOperand!;
        } else {
          throw ArgumentError('You cannot divide by zero.');
        }
      });

  static Operator square = Operator(
      symbols: "sqr",
      operation: (num firstOperand, num? secondOperand) {
        return pow(firstOperand, 2);
      });

  static Operator squareRoot = Operator(
      symbols: "√",
      operation: (num firstOperand, num? secondOperand) {
        if (firstOperand < 0) throw Exception('Number must be non-negative.');
        return sqrt(firstOperand);
      });

  static Operator inverse = Operator(
      symbols: "1/",
      operation: (num firstOperand, num? secondOperand) {
        if (firstOperand != 0) {
          return 1 / firstOperand;
        } else {
          throw ArgumentError('You cannot divide by zero.');
        }
      });

  static Operator power = Operator(
      symbols: "^",
      isUnary: false,
      operation: (num firstOperand, num? secondOperand) {
        return pow(firstOperand, secondOperand!);
      });

  static Operator modulus = Operator(
      symbols: "%",
      isUnary: false,
      operation: (num firstOperand, num? secondOperand) {
        return firstOperand % secondOperand!;
      });

  static Operator factorial = Operator(
      symbols: "!",
      operation: (num firstOperand, num? secondOperand) {
        if (firstOperand < 0) {
          throw ArgumentError('Number must be non-negative.');
        } else if (firstOperand == 0) {
          return 1;
        } else {
          return firstOperand * factorial.operation(firstOperand - 1, null);
        }
      });

  static Operator logarithm = Operator(
      symbols: "log",
      operation: (num firstOperand, num? secondOperand) {
        return log(firstOperand);
      });

  static Operator tangent = Operator(
      symbols: "tan",
      operation: (num firstOperand, num? secondOperand) {
        return tan(firstOperand);
      });

  static Operator cosine = Operator(
      symbols: "cos",
      operation: (num firstOperand, num? secondOperand) {
        return cos(firstOperand);
      });

  static Operator absolute = Operator(
      symbols: "|",
      operation: (num firstOperand, num? secondOperand) {
        return firstOperand.abs();
      });

  static Operator exponential = Operator(
      symbols: "e^",
      operation: (num firstOperand, num? secondOperand) {
        return exp(firstOperand);
      });

  static Operator none = Operator(
      symbols: "",
      operation: (num firstOperand, num? secondOperand) {
        return firstOperand;
      });

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
    none
  ];
}
