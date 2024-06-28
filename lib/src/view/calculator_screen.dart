import 'package:flutter/material.dart';
import 'package:flutter_calculator/src/model/calculator.dart';
import 'package:flutter_calculator/src/model/operation.dart';
import 'package:flutter_calculator/src/model/operator.dart';
import 'package:flutter_calculator/src/view/components/calculator_app_bar.dart';
import 'package:flutter_calculator/src/view/components/calculator_button.dart';
import 'package:flutter_calculator/src/view/components/calculator_icon_button.dart';
import 'package:flutter_calculator/src/view/components/input_output_displayer.dart';
import 'package:flutter_calculator/src/view/components/operation_displayer.dart';

class CalculatorScreen extends StatefulWidget {
  final String title;
  final Calculator calculator;

  CalculatorScreen({
    Key? key,
    required this.title,
    required this.calculator,
  }) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final String _displayedValue = "0";

  final Operation currentOperation = Operation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalculatorAppBar(widget: widget),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    Expanded(
                        child: OperationDisplayer(
                      operationToDisplay: currentOperation,
                    )),
                    Expanded(
                      flex: 2,
                      child: Container(
                          padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                          alignment: Alignment.topRight,
                          child: InputOutputDisplayer(
                            valueToDisplay: _displayedValue,
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
          // Expanded(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     mainAxisSize: MainAxisSize.max,
          //     crossAxisAlignment: CrossAxisAlignment.stretch,
          //     children: [
          //       CalculatorButton(name: "MC", onPressed: () => {}),
          //       CalculatorButton(name: "MR", onPressed: () => {}),
          //       CalculatorButton(name: "M+", onPressed: () => {}),
          //       CalculatorButton(name: "M-", onPressed: () => {}),
          //       CalculatorButton(name: "MS", onPressed: () => {}),
          //     ],
          //   ), // Buttons
          // ),
          const SizedBox(height: 5),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: CalculatorButton(
                      name: "%",
                      onPressed: () => widget.calculator
                          .setCurrentOperator(Operator.modulus),
                      buttonColor: Colors.white70),
                ),
                Expanded(
                  child: CalculatorButton(
                      name: "CE",
                      onPressed: widget.calculator.clearEntry,
                      buttonColor: Colors.white70),
                ),
                Expanded(
                  child: CalculatorButton(
                      name: "C",
                      onPressed: widget.calculator.clear,
                      buttonColor: Colors.white70),
                ),
                Expanded(
                  child: CalculatorIconButton(
                    name: "backspace_outlined",
                    onPressed: widget.calculator.backspace,
                    buttonColor: Colors.white70, // Colors.redAccent,
                  ),
                ),
              ],
            ), // Buttons
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: CalculatorButton(
                      name: "¹/x",
                      onPressed: () => widget.calculator
                          .setCurrentOperator(Operator.inverse),
                      buttonColor: Colors.white70),
                ),
                Expanded(
                  child: CalculatorButton(
                      name: "x²",
                      onPressed: () =>
                          widget.calculator.setCurrentOperator(Operator.square),
                      buttonColor: Colors.white70),
                ),
                Expanded(
                  child: CalculatorButton(
                      name: "²√x",
                      onPressed: () => widget.calculator
                          .setCurrentOperator(Operator.squareRoot),
                      buttonColor: Colors.white70),
                ),
                Expanded(
                  child: CalculatorButton(
                      name: "÷",
                      onPressed: () =>
                          widget.calculator.setCurrentOperator(Operator.divide),
                      buttonColor: Colors.white70),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: CalculatorButton(
                        name: "7",
                        onPressed: () => widget.calculator.addDigit("7"))),
                Expanded(
                    child: CalculatorButton(
                        name: "8",
                        onPressed: () => widget.calculator.addDigit("8"))),
                Expanded(
                    child: CalculatorButton(
                        name: "9",
                        onPressed: () => widget.calculator.addDigit("9"))),
                Expanded(
                  child: CalculatorButton(
                      name: "*",
                      onPressed: () => widget.calculator
                          .setCurrentOperator(Operator.multiply),
                      buttonColor: Colors.white70),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: CalculatorButton(
                        name: "4",
                        onPressed: () => widget.calculator.addDigit("4"))),
                Expanded(
                    child: CalculatorButton(
                        name: "5",
                        onPressed: () => widget.calculator.addDigit("5"))),
                Expanded(
                    child: CalculatorButton(
                        name: "6",
                        onPressed: () => widget.calculator.addDigit("6"))),
                Expanded(
                  child: CalculatorButton(
                      name: "-",
                      onPressed: () => {
                            widget.calculator
                                .setCurrentOperator(Operator.subtract)
                          },
                      buttonColor: Colors.white70),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: CalculatorButton(
                        name: "1",
                        onPressed: () => widget.calculator.addDigit("1"))),
                Expanded(
                    child: CalculatorButton(
                        name: "2",
                        onPressed: () => widget.calculator.addDigit("2"))),
                Expanded(
                    child: CalculatorButton(
                        name: "3",
                        onPressed: () => widget.calculator.addDigit("3"))),
                Expanded(
                  child: CalculatorButton(
                      name: "+",
                      onPressed: () =>
                          widget.calculator.setCurrentOperator(Operator.add),
                      buttonColor: Colors.white70),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: CalculatorButton(
                        name: "+/-", onPressed: widget.calculator.plusMinus)),
                Expanded(
                    child: CalculatorButton(
                        name: "0",
                        onPressed: () => widget.calculator.addDigit("0"))),
                Expanded(
                    child: CalculatorButton(
                        name: ".", onPressed: widget.calculator.setDecimal)),
                Expanded(
                  child: CalculatorButton(
                      name: "=",
                      onPressed: widget.calculator.endOperation,
                      buttonColor: Colors.blueAccent),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
