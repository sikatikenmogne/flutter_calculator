import 'package:flutter/material.dart';

class ResultDisplayer extends StatelessWidget {
  String? value = "0";

  ResultDisplayer({super.key, String this.value = "0"});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              value!,
              style: const TextStyle(fontSize: 48.0),
              textAlign: TextAlign.end,
            )
          ],
        ), 
      ),
    );
  }
}
