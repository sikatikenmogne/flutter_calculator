import 'package:flutter/material.dart';

import 'calculator_operator_enum.dart';

class ResultDisplayer extends StatelessWidget {
  final double firstOperand;
  final double secondOperand;
  final CalculatorOperator calculatorOperator;
  final double padding;
  final double fontSize;
  final Color color;

  ResultDisplayer({
    Key? key,
    this.firstOperand = 0.0,
    this.secondOperand = 0.0,
    this.calculatorOperator = CalculatorOperator.NONE,
    this.padding = 8.0,
    this.fontSize = 48.0,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Container(
          child: Text(
            calculatorOperator != CalculatorOperator.NONE
                ? _computeOperation(firstOperand, secondOperand, calculatorOperator)
                : "$firstOperand",
            style: TextStyle(fontSize: fontSize, color: color),
            textAlign: TextAlign.end,
          )),
    );
  }

  String _computeOperation(double firstOperand, double secondOperand, CalculatorOperator calculatorOperator) {
      switch (calculatorOperator) {
        case CalculatorOperator.ADD:
          return (firstOperand + secondOperand).toString();
          break;
        case CalculatorOperator.SUBTRACT:
          return (firstOperand - secondOperand).toString();
          break;
        case CalculatorOperator.MULTIPLY:
          return (firstOperand * secondOperand).toString();
          break;
        case CalculatorOperator.DIVIDE:
          return (firstOperand / secondOperand).toString();
          break;
        default:
          return "0";
      }
  }


}
