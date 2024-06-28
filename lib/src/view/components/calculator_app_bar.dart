import 'package:flutter/material.dart';
import 'package:flutter_calculator/src/app.dart';
import 'package:flutter_calculator/src/view/calculator_screen.dart';

class CalculatorAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CalculatorAppBar({
    super.key,
    required this.widget,
  });

  final CalculatorScreen widget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 8.0, 0),
            child: IconButton(
              icon: const Icon(Icons.pin_invoke_rounded,
                  color: Colors.black87, size: 20.0),
              tooltip: 'Pin calculator',
              onPressed: () {},
            ),
          ),
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8.0, 0),
              child: IconButton(
                icon: const Icon(Icons.history_outlined,
                    color: Colors.black87, size: 20.0),
                tooltip: 'Operations history',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ], //<Widget>[]
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.black87, size: 20.0),
        tooltip: 'Menu',
        onPressed: () {},
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
