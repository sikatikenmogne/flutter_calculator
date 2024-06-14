import 'package:flutter/material.dart';

class CalculatorIconButton extends StatelessWidget {
  final String name;
  final void Function() onPressed;
  final Color buttonColor;

  const CalculatorIconButton({
    super.key,
    required this.name,
    required this.onPressed,
    this.buttonColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(buttonColor),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )),
          ),
          child: const Icon(
            Icons.backspace_outlined,
            color: Colors.black87,
            size: 20.0,
          ),
        ));
  }
}
