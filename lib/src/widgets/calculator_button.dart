import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CalculatorButton extends StatelessWidget {
  final String name;
  final void Function() onPressed;
  final TextStyle textStyle;
  final Color buttonColor;

  const CalculatorButton({
    super.key,
    required this.name,
    required this.onPressed,
    this.textStyle = const TextStyle(fontSize: 24.0, color: Colors.black87),
    this.buttonColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(this.buttonColor),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )),
          ),
          child: Text(name, style: textStyle, textAlign: TextAlign.center),
        ));
  }
}
