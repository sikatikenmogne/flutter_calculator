import 'package:flutter/material.dart';

class ResultDisplayer extends StatelessWidget {
  final String value;
  final double padding;
  final double fontSize;
  final Color color;

  ResultDisplayer({
    Key? key,
    this.value = "0",
    this.padding = 8.0,
    this.fontSize = 48.0,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Container(
          child: Text(
            value,
            style: TextStyle(fontSize: fontSize, color: color),
            textAlign: TextAlign.end,
          )),
    );
  }
}
