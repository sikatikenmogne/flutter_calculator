import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_calculator/src/view/components/calculator_icon_button.dart';

void main() {
  group('CalculatorIconButton', () {
    testWidgets('displays the correct icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CalculatorIconButton(
              name: 'Backspace',
              onPressed: () {},
              buttonColor: Colors.white,
            ),
          ),
        ),
      );
  
      final iconFinder = find.byIcon(Icons.backspace_outlined);
      expect(iconFinder, findsOneWidget);
    });
  
    testWidgets('calls the onPressed callback when pressed', (WidgetTester tester) async {
      bool onPressedCalled = false;
  
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CalculatorIconButton(
              name: 'Backspace',
              onPressed: () {
                onPressedCalled = true;
              },
              buttonColor: Colors.white,
            ),
          ),
        ),
      );
  
      final buttonFinder = find.byType(ElevatedButton);
      expect(buttonFinder, findsOneWidget);
  
      await tester.tap(buttonFinder);
      expect(onPressedCalled, true);
    });
  });
}