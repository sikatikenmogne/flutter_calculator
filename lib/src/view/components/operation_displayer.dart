import 'package:flutter/material.dart';

import '../../model/operation.dart';

class OperationDisplayer extends StatelessWidget {
  final Operation? operationToDisplay;
  final double padding;
  final double fontSize;
  final Color color;
  OperationDisplayer(
      {Key? key,
      this.operationToDisplay,
      this.padding = 8.0,
      this.fontSize = 20.0,
      this.color = Colors.grey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(padding, padding, padding, 0.0),
      child: Text(
        operationToDisplay?.toString() ?? Operation().toString(),
        style: TextStyle(fontSize: fontSize, color: color),
        textAlign: TextAlign.end,
      ),
    );
  }
}
