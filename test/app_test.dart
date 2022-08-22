import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pexels_view/src/app.dart';

void main() {
  testWidgets(
    'App should have the Search widget title',
    (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      expect(find.widgetWithText(ElevatedButton, 'Search'), findsOneWidget);
    },
  );
}
