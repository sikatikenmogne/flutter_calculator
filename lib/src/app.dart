import 'package:flutter/material.dart';
import 'package:flutter_calculator/src/model/calculator.dart';
import 'package:flutter_calculator/src/view/calculator_screen.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return CalculatorScreen(
      title: widget.title,
      calculator: Calculator(),
    );
  }
}
