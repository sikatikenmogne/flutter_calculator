import 'package:flutter/material.dart';

class CalculatorIconButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressedButton;
  final Color buttonColor;

  CalculatorIconButton({
    Key? key,
    required this.name,
    required this.onPressedButton,
    this.buttonColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ElevatedButton(
              onPressed: onPressedButton,
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )),
              ),
              child: const Icon(
                Icons.backspace_outlined,
                color: Colors.black87,
                size: 20.0,
              ),
            )));
  }
}
