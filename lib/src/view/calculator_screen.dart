import 'package:flutter/material.dart';
import 'package:flutter_calculator/src/model/calculator.dart';
import 'package:flutter_calculator/src/model/operation.dart';
import 'package:flutter_calculator/src/model/operator.dart';
import 'package:flutter_calculator/src/view/components/calculator_app_bar.dart';
import 'package:flutter_calculator/src/view/components/calculator_button.dart';
import 'package:flutter_calculator/src/view/components/calculator_icon_button.dart';
import 'package:flutter_calculator/src/view/components/input_output_displayer.dart';
import 'package:flutter_calculator/src/view/components/operation_displayer.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatelessWidget {
  final String title;
  final Calculator calculator;

  CalculatorScreen({
    Key? key,
    required this.title,
    required this.calculator,
  }) : super(key: key);

  final Operation currentOperation = Operation();

  @override
  Widget build(BuildContext context) {
    return Consumer<Calculator>(
      builder: (context, calculator, child) {
        return Scaffold(
          appBar: CalculatorAppBar(widget: this),
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
                          operationToDisplay: Provider.of<Calculator>(context, listen: false).currentOperation,
                        )),
                        Expanded(
                          flex: 2,
                          child: Container(
                              padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                              alignment: Alignment.topRight,
                              child: InputOutputDisplayer(
                                valueToDisplay: Provider.of<Calculator>(context, listen: false).displayedValue,
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
                          onPressed: () => Provider.of<Calculator>(context, listen: false)
                              .setCurrentOperator(Operator.modulus),
                          buttonColor: Colors.white70),
                    ),
                    Expanded(
                      child: CalculatorButton(
                          name: "CE",
                          onPressed: Provider.of<Calculator>(context, listen: false).clearEntry,
                          buttonColor: Colors.white70),
                    ),
                    Expanded(
                      child: CalculatorButton(
                          name: "C",
                          onPressed: Provider.of<Calculator>(context, listen: false).clear,
                          buttonColor: Colors.white70),
                    ),
                    Expanded(
                      child: CalculatorIconButton(
                        name: "backspace_outlined",
                        onPressed: Provider.of<Calculator>(context, listen: false).backspace,
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
                          onPressed: () => Provider.of<Calculator>(context, listen: false)
                              .setCurrentOperator(Operator.inverse),
                          buttonColor: Colors.white70),
                    ),
                    Expanded(
                      child: CalculatorButton(
                          name: "x²",
                          onPressed: () =>
                              Provider.of<Calculator>(context, listen: false).setCurrentOperator(Operator.square),
                          buttonColor: Colors.white70),
                    ),
                    Expanded(
                      child: CalculatorButton(
                          name: "²√x",
                          onPressed: () => Provider.of<Calculator>(context, listen: false)
                              .setCurrentOperator(Operator.squareRoot),
                          buttonColor: Colors.white70),
                    ),
                    Expanded(
                      child: CalculatorButton(
                          name: "÷",
                          onPressed: () =>
                              Provider.of<Calculator>(context, listen: false).setCurrentOperator(Operator.divide),
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
                            onPressed: () => Provider.of<Calculator>(context, listen: false).addDigit("7"))),
                    Expanded(
                        child: CalculatorButton(
                            name: "8",
                            onPressed: () => Provider.of<Calculator>(context, listen: false).addDigit("8"))),
                    Expanded(
                        child: CalculatorButton(
                            name: "9",
                            onPressed: () => Provider.of<Calculator>(context, listen: false).addDigit("9"))),
                    Expanded(
                      child: CalculatorButton(
                          name: "*",
                          onPressed: () => Provider.of<Calculator>(context, listen: false)
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
                            onPressed: () => Provider.of<Calculator>(context, listen: false).addDigit("4"))),
                    Expanded(
                        child: CalculatorButton(
                            name: "5",
                            onPressed: () => Provider.of<Calculator>(context, listen: false).addDigit("5"))),
                    Expanded(
                        child: CalculatorButton(
                            name: "6",
                            onPressed: () => Provider.of<Calculator>(context, listen: false).addDigit("6"))),
                    Expanded(
                      child: CalculatorButton(
                          name: "-",
                          onPressed: () => {
                                Provider.of<Calculator>(context, listen: false)
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
                            onPressed: () => Provider.of<Calculator>(context, listen: false).addDigit("1"))),
                    Expanded(
                        child: CalculatorButton(
                            name: "2",
                            onPressed: () => Provider.of<Calculator>(context, listen: false).addDigit("2"))),
                    Expanded(
                        child: CalculatorButton(
                            name: "3",
                            onPressed: () => Provider.of<Calculator>(context, listen: false).addDigit("3"))),
                    Expanded(
                      child: CalculatorButton(
                          name: "+",
                          onPressed: () =>
                              Provider.of<Calculator>(context, listen: false).setCurrentOperator(Operator.add),
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
                            name: "+/-", onPressed: Provider.of<Calculator>(context, listen: false).plusMinus)),
                    Expanded(
                        child: CalculatorButton(
                            name: "0",
                            onPressed: () => Provider.of<Calculator>(context, listen: false).addDigit("0"))),
                    Expanded(
                        child: CalculatorButton(
                            name: ".", onPressed: Provider.of<Calculator>(context, listen: false).setDecimal)),
                    Expanded(
                      child: CalculatorButton(
                          name: "=",
                          onPressed: Provider.of<Calculator>(context, listen: false).endOperation,
                          buttonColor: Colors.blueAccent),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
