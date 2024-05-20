enum CalculatorOperator {
  add,
  subtract,
  multiply,
  divide,
  none,
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
}

extension CalculatorOperatorExtension on CalculatorOperator {
  String get value {
    switch (this) {
      case CalculatorOperator.add:
        return '+';
      case CalculatorOperator.subtract:
        return '-';
      case CalculatorOperator.multiply:
        return '*';
      case CalculatorOperator.divide:
        return '÷';
      case CalculatorOperator.none:
        return '';
      case CalculatorOperator.square:
        return '²';
      case CalculatorOperator.squareRoot:
        return '√';
      case CalculatorOperator.inverse:
        return '1/';
      case CalculatorOperator.power:
        return '^';
      case CalculatorOperator.modulus:
        return '%';
      case CalculatorOperator.factorial:
        return '!';
      case CalculatorOperator.logarithm:
        return 'log';
      case CalculatorOperator.tangent:
        return 'tan';
      case CalculatorOperator.cosine:
        return 'cos';
      case CalculatorOperator.absolute:
        return '|';
      case CalculatorOperator.exponential:
        return 'e^';

      default:
        return '';
    }
  }
}
