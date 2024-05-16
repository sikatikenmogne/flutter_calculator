enum CalculatorOperator {
  ADD,
  SUBTRACT,
  MULTIPLY,
  DIVIDE,
  NONE,
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
        return '/';
      case CalculatorOperator.NONE:
        return '';
      default:
        return '';
    }
  }
}