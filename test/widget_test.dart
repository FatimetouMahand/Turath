import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:turath/main.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app title is displayed.
    expect(find.text('تراثنا'), findsOneWidget);
  });
}
