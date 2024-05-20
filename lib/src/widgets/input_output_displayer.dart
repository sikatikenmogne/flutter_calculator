import 'package:flutter/material.dart';

import '../models/calculator_operator_enum.dart';

class InputOutputDisplayer extends StatelessWidget {
  final String valueToDisplay;
  final CalculatorOperator calculatorOperator;
  final double padding;
  final double fontSize;
  final Color color;

  InputOutputDisplayer({
    Key? key,
    this.valueToDisplay = "0.0",
    this.calculatorOperator = CalculatorOperator.none,
    this.padding = 8.0,
    this.fontSize = 48.0,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(padding, 0.0, padding, padding),
      child: Container(
          alignment: Alignment.topRight,
          child: Text(
            valueToDisplay,
            style: TextStyle(
                fontSize: fontSize, color: color, fontWeight: FontWeight.bold),
            textAlign: TextAlign.end,
          )),
    );
  }
}
