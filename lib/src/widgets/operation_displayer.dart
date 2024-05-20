import 'package:flutter/material.dart';
import 'package:flutter_calculator/src/models/calculator_operator_enum.dart';

class OperationDisplayer extends StatelessWidget {
  final double firstOperand;
  final double secondOperand;
  final CalculatorOperator calculatorOperator;
  final double padding;
  final double fontSize;
  final Color color;
  final bool operationEnded;
  OperationDisplayer(
      {Key? key,
      this.firstOperand = 0.0,
      this.secondOperand = 0.0,
      this.calculatorOperator = CalculatorOperator.none,
      this.operationEnded = false,
      this.padding = 8.0,
      this.fontSize = 20.0,
      this.color = Colors.grey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(padding, padding, padding, 0.0),
      child: Text(
        "$firstOperand${calculatorOperator != CalculatorOperator.none ? " ${calculatorOperator.value}" : ""}${secondOperand != 0 && operationEnded ? " $secondOperand" : ""}${operationEnded ? " =" : ""}",
        style: TextStyle(fontSize: fontSize, color: color),
        textAlign: TextAlign.end,
      ),
    );
  }
}
