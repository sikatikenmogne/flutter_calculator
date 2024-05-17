import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_calculator/src/calculator/calculator_operator_enum.dart';
import 'package:flutter_calculator/src/calculator/input_output_displayer.dart';

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
      this.calculatorOperator = CalculatorOperator.NONE,
      this.operationEnded = false,
      this.padding = 2.0,
      this.fontSize = 20.0,
      this.color = Colors.grey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Container(
          child: Text(
        calculatorOperator != CalculatorOperator.NONE
            ? "$firstOperand ${calculatorOperator.value} ${secondOperand != 0 ? "$secondOperand" : ""}${operationEnded ? " =" : ""}"
            : "$firstOperand",
        style: TextStyle(fontSize: fontSize, color: color),
        textAlign: TextAlign.end,
      )),
    );
  }
}
