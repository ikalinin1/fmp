import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fmp/main.dart';

void main() {
  testWidgets('Test links presence and add button', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Google'), findsOneWidget);
    expect(find.text('Yandex'), findsOneWidget);
    expect(find.text('Link'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('Google'), findsOneWidget);
    expect(find.text('Yandex'), findsOneWidget);
    expect(find.text('Link'), findsOneWidget);
  });
}
