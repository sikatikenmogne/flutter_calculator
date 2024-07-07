import 'package:flutter/material.dart';


class InputOutputDisplayer extends StatelessWidget {
  final String valueToDisplay;
  final double padding;
  final double fontSize;
  final Color color;

  InputOutputDisplayer({
    Key? key,
    this.valueToDisplay = "0",
    this.padding = 8.0,
    this.fontSize = 48.0,
    this.color = Colors.black,
  }) : super(key: key);

  String _formatNumber(double number) {
    if (number % 1 == 0) {
      return number.toInt().toString();
    } else {
      return number.toString();
    }
  }

  bool _isNumeric(String str) {
    if(str.isEmpty) return false;
    return double.tryParse(str) != null;
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(padding, 0.0, padding, padding),
      child: Container(
          alignment: Alignment.topRight,
          child: Text(
            valueToDisplay.contains('.') ? valueToDisplay : _isNumeric(valueToDisplay)? _formatNumber(double.parse(valueToDisplay)) : valueToDisplay,
            style: TextStyle(
                fontSize: _isNumeric(valueToDisplay)? fontSize: 20.0, color: color, fontWeight: FontWeight.bold),
            textAlign: TextAlign.end,
          )),
    );
  }
}
