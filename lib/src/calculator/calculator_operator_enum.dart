enum CalculatorOperator {
  ADD,
  SUBTRACT,
  MULTIPLY,
  DIVIDE,
  NONE,
  SQUARE,
  SQUARE_ROOT,
  INVERSE,
  POWER,
  MODULUS,
  FACTORIAL,
  LOGARITHM,
  TANGENT,
  COSINE,
  ABSOLUTE,
  EXPONENTIAL,
}

extension CalculatorOperatorExtension on CalculatorOperator {
  String get value {
    switch (this) {
      case CalculatorOperator.ADD:
        return '+';
      case CalculatorOperator.SUBTRACT:
        return '-';
      case CalculatorOperator.MULTIPLY:
        return '*';
      case CalculatorOperator.DIVIDE:
        return '÷';
      case CalculatorOperator.NONE:
        return '';
      case CalculatorOperator.SQUARE:
        return '²';
      case CalculatorOperator.SQUARE_ROOT:
        return '√';
      case CalculatorOperator.INVERSE:
        return '1/';
      case CalculatorOperator.POWER:
        return '^';
      case CalculatorOperator.MODULUS:
        return '%';
      case CalculatorOperator.FACTORIAL:
        return '!';
      case CalculatorOperator.LOGARITHM:
        return 'log';
      case CalculatorOperator.TANGENT:
        return 'tan';
      case CalculatorOperator.COSINE:
        return 'cos';
      case CalculatorOperator.ABSOLUTE:
        return '|';
      case CalculatorOperator.EXPONENTIAL:
        return 'e^';

      default:
        return '';
    }
  }
}
