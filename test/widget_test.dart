import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widget_samples/main.dart';

void main() {
  testWidgets('App launches and shows categories', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that we see the title.
    expect(find.text('Flutter Widget Catalog'), findsOneWidget);

    // Verify that we see some categories.
    expect(find.text('LAYOUT'), findsOneWidget);
    expect(find.text('TEXT'), findsOneWidget);

    // Scroll to find items further down
    await tester.drag(find.byType(ListView), const Offset(0, -500));
    await tester.pump();

    expect(find.text('ANIMATION'), findsOneWidget);
  });
}
