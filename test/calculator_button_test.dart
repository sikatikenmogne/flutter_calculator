import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_calculator/src/view/components/calculator_button.dart';

void main() {
  group("CalculatorButton", () {
    testWidgets('CalculatorButton displays correct name',
        (WidgetTester tester) async {
      final buttonName = 'Test Button';
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CalculatorButton(
              name: buttonName,
              onPressed: () {},
            ),
          ),
        ),
      );

      final buttonFinder = find.text(buttonName);
      expect(buttonFinder, findsOneWidget);
    });

    testWidgets('CalculatorButton calls onPressed when pressed',
        (WidgetTester tester) async {
      bool onPressedCalled = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CalculatorButton(
              name: 'Test Button',
              onPressed: () {
                onPressedCalled = true;
              },
            ),
          ),
        ),
      );

      final buttonFinder = find.byType(ElevatedButton);
      expect(buttonFinder, findsOneWidget);

      await tester.tap(buttonFinder);
      expect(onPressedCalled, true);
    });

    testWidgets('CalculatorButton has correct text style',
        (WidgetTester tester) async {
      final textStyle = TextStyle(fontSize: 20.0, color: Colors.red);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CalculatorButton(
              name: 'Test Button',
              onPressed: () {},
              textStyle: textStyle,
            ),
          ),
        ),
      );

      final textFinder = find.text('Test Button');
      final textWidget = tester.widget<Text>(textFinder);
      expect(textWidget.style, textStyle);
    });

    testWidgets('CalculatorButton has correct button color',
        (WidgetTester tester) async {
      final buttonColor = Colors.blue;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CalculatorButton(
              name: 'Test Button',
              onPressed: () {},
              buttonColor: buttonColor,
            ),
          ),
        ),
      );

      final buttonFinder = find.byType(ElevatedButton);
      final buttonWidget = tester.widget<ElevatedButton>(buttonFinder);
      expect(buttonWidget.style!.backgroundColor!.resolve({}), buttonColor);
    });
  });
}
