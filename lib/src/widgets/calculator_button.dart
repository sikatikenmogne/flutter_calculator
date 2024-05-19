import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CalculatorButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressedButton;
  final TextStyle textStyle;
  final Color buttonColor;

  const CalculatorButton({
      super.key,
      required this.name,
      required this.onPressedButton,
      this.textStyle = const TextStyle(fontSize: 24.0, color: Colors.black87),
      this.buttonColor = Colors.white,
    });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ElevatedButton(
              onPressed: onPressedButton!,
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(this.buttonColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )),
              ),
              child: Text(name, style: textStyle, textAlign: TextAlign.center),
            )));
  }
}
