import 'package:flutter/material.dart';
import 'package:flutter_calculator/src/model/operation.dart';
import 'package:flutter_calculator/src/model/operator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_calculator/src/view/components/operation_displayer.dart';

void main() {
  group('OperationDisplayer', () {
    testWidgets('Should display the default operation',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: OperationDisplayer(),
        ),
      );

      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('Should display the provided operation',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: OperationDisplayer(
            operationToDisplay: Operation(
              firstOperand: 5.0,
              secondOperand: 3.0,
              calculatorOperator: Operator.add,
              operationEnded: true,
            ),
          ),
        ),
      );

      expect(find.text('5 + 3 ='), findsOneWidget);
    });

    testWidgets('Should display the default style',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: OperationDisplayer(),
        ),
      );

      final textWidget = tester.widget<Text>(find.byType(Text));
      expect(textWidget.style?.fontSize, equals(20.0));
      expect(textWidget.style?.color, equals(Colors.grey));
    });

    testWidgets('Should display the provided style',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: OperationDisplayer(
            fontSize: 24.0,
            color: Colors.blue,
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.byType(Text));
      expect(textWidget.style?.fontSize, equals(24.0));
      expect(textWidget.style?.color, equals(Colors.blue));
    });

    // Add more test cases as needed
  });
}
