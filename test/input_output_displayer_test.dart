import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_calculator/src/view/components/input_output_displayer.dart';

void main() {
  group('InputOutputDisplayer', () {
    testWidgets('Should display the default value', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: InputOutputDisplayer(),
        ),
      );

      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('Should display the provided value', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: InputOutputDisplayer(valueToDisplay: '123'),
        ),
      );

      expect(find.text('123'), findsOneWidget);
    });

    testWidgets('Should format integer number correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: InputOutputDisplayer(valueToDisplay: '42.0'),
        ),
      );

      expect(find.text('42.0'), findsOneWidget);
    });

    testWidgets('Should format decimal number correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: InputOutputDisplayer(valueToDisplay: '3.14'),
        ),
      );

      expect(find.text('3.14'), findsOneWidget);
    });

    // Add more test cases as needed
  });
}