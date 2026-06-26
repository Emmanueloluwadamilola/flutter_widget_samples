import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_widget_samples/main.dart';
import 'package:flutter_widget_samples/services/catalog_prefs.dart';

Future<CatalogPrefs> _buildPrefs() async {
  SharedPreferences.setMockInitialValues({});
  return CatalogPrefs(await SharedPreferences.getInstance());
}

void main() {
  testWidgets('App launches and shows categories', (WidgetTester tester) async {
    final prefs = await _buildPrefs();
    await tester.pumpWidget(MyApp(prefs: prefs));
    await tester.pumpAndSettle();

    expect(find.text('Flutter Widget Catalog'), findsOneWidget);
    expect(find.text('LAYOUT'), findsOneWidget);
    expect(find.text('TEXT'), findsOneWidget);
    expect(find.text('ANIMATION'), findsOneWidget);
  });

  testWidgets('Tapping a category opens its widget list', (tester) async {
    final prefs = await _buildPrefs();
    await tester.pumpWidget(MyApp(prefs: prefs));
    await tester.pumpAndSettle();

    await tester.tap(find.text('LAYOUT'));
    await tester.pumpAndSettle();

    // The Layout category contains the Container widget sample.
    expect(find.text('Container'), findsWidgets);
  });

  testWidgets('Search finds a widget by name', (tester) async {
    final prefs = await _buildPrefs();
    await tester.pumpWidget(MyApp(prefs: prefs));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'SizedBox');
    await tester.pumpAndSettle();

    expect(find.text('SizedBox'), findsWidgets);
  });
}
